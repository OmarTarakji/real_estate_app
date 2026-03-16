import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:real_estate_app/src/features/offers/application/offers_state.dart';
import 'package:real_estate_app/src/features/offers/domain/offer_models.dart';

class OfferThreadScreen extends ConsumerStatefulWidget {
  const OfferThreadScreen({super.key, required this.threadId});

  final String threadId;

  @override
  ConsumerState<OfferThreadScreen> createState() => _OfferThreadScreenState();
}

class _OfferThreadScreenState extends ConsumerState<OfferThreadScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final thread = ref
        .watch(offersProvider)
        .where((t) => t.id == widget.threadId)
        .cast<OfferThread?>()
        .firstOrNull;

    final lastOfferAmount = ref
        .read(offersProvider.notifier)
        .lastOfferAmount(widget.threadId);

    if (thread == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('المحادثة')),
        body: const Center(child: Text('العرض غير موجود')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('العروض - ${thread.propertyTitle}'),
        actions: [
          _StatusChip(status: thread.status),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          _PriceAnchor(originalPrice: thread.originalPrice),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: thread.messages.length,
              itemBuilder: (context, index) {
                final m = thread.messages[index];
                return _MessageBubble(message: m);
              },
            ),
          ),
          if (thread.status == OfferThreadStatus.negotiating)
            _ActionBar(
              onSendCounterOffer: () => _sendCounterOffer(
                originalPrice: thread.originalPrice,
                lastOfferAmount: lastOfferAmount,
              ),
              onAccept: () =>
                  ref.read(offersProvider.notifier).accept(thread.id),
              onReject: () =>
                  ref.read(offersProvider.notifier).reject(thread.id),
            )
          else
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
              ),
              child: Text(
                thread.status == OfferThreadStatus.accepted
                    ? 'تم إغلاق التفاوض بعد القبول'
                    : 'تم إغلاق التفاوض بعد الرفض',
                style: theme.textTheme.bodyMedium,
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _sendCounterOffer({
    required int originalPrice,
    required int? lastOfferAmount,
  }) async {
    if (lastOfferAmount == null || lastOfferAmount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('لا يوجد عرض سابق لتقديم عرض مضاد عليه')),
      );
      return;
    }

    final amount = await showDialog<int>(
      context: context,
      builder: (context) => _OfferAmountDialog(
        title: 'عرض مضاد',
        originalPrice: originalPrice,
        minExclusive: lastOfferAmount,
        maxExclusive: originalPrice,
      ),
    );

    if (amount == null) return;

    ref
        .read(offersProvider.notifier)
        .sendOffer(threadId: widget.threadId, amount: amount, isCounter: true);
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({required this.message});

  final OfferMessage message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMe = message.senderId == OffersNotifier.currentUserId;

    final bubbleColor = message.type == OfferMessageType.system
        ? theme.colorScheme.surfaceContainerHighest
        : isMe
        ? theme.colorScheme.primaryContainer
        : theme.colorScheme.secondaryContainer;

    final textColor = message.type == OfferMessageType.system
        ? theme.colorScheme.onSurface
        : isMe
        ? theme.colorScheme.onPrimaryContainer
        : theme.colorScheme.onSecondaryContainer;

    final align = message.type == OfferMessageType.system
        ? Alignment.center
        : isMe
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Align(
      alignment: align,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 320),
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (message.type != OfferMessageType.system)
              Text(
                message.senderName,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: textColor.withAlpha(200),
                ),
              ),
            if (message.amount != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '\$${message.amount}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                message.text,
                style: theme.textTheme.bodyMedium?.copyWith(color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({
    required this.onSendCounterOffer,
    required this.onAccept,
    required this.onReject,
  });

  final VoidCallback onSendCounterOffer;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          border: Border(
            top: BorderSide(color: theme.colorScheme.outlineVariant),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onSendCounterOffer,
                    icon: const Icon(LucideIcons.refreshCcw),
                    label: const Text('عرض مضاد'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: onAccept,
                    icon: const Icon(LucideIcons.check),
                    label: const Text('قبول'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FilledButton.tonalIcon(
                    onPressed: onReject,
                    icon: const Icon(LucideIcons.x),
                    label: const Text('رفض'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceAnchor extends StatelessWidget {
  const _PriceAnchor({required this.originalPrice});

  final int originalPrice;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        border: Border(
          bottom: BorderSide(color: theme.colorScheme.outlineVariant),
        ),
      ),
      child: Row(
        children: [
          const Icon(LucideIcons.tag, size: 18),
          const SizedBox(width: 8),
          Text('السعر الأصلي:', style: theme.textTheme.labelLarge),
          const SizedBox(width: 8),
          Text(
            '\$$originalPrice',
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final OfferThreadStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final (text, bg, fg) = switch (status) {
      OfferThreadStatus.negotiating => (
        'قيد التفاوض',
        theme.colorScheme.secondaryContainer,
        theme.colorScheme.secondary,
      ),
      OfferThreadStatus.accepted => (
        'مقبول',
        theme.colorScheme.tertiaryContainer,
        theme.colorScheme.tertiary,
      ),
      OfferThreadStatus.rejected => (
        'مرفوض',
        theme.colorScheme.errorContainer,
        theme.colorScheme.error,
      ),
    };

    return Container(
      margin: const EdgeInsetsDirectional.only(end: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: theme.textTheme.labelMedium?.copyWith(
          color: fg,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _OfferAmountDialog extends StatefulWidget {
  const _OfferAmountDialog({
    required this.title,
    required this.originalPrice,
    required this.minExclusive,
    required this.maxExclusive,
  });

  final String title;
  final int originalPrice;
  final int minExclusive;
  final int maxExclusive;

  @override
  State<_OfferAmountDialog> createState() => _OfferAmountDialogState();
}

class _OfferAmountDialogState extends State<_OfferAmountDialog> {
  final _controller = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('السعر الأصلي: \$${widget.originalPrice}'),
          const SizedBox(height: 8),
          Text(
            'يجب أن يكون العرض المضاد أقل من السعر الأصلي وأكبر من آخر عرض',
            softWrap: true,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'السعر المقترح (\$)',
              errorText: _error,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('إلغاء'),
        ),
        FilledButton(
          onPressed: () {
            final raw = _controller.text.trim();
            final amount = int.tryParse(raw);
            if (amount == null) {
              setState(() => _error = 'أدخل رقمًا صحيحًا');
              return;
            }

            if (!(amount > widget.minExclusive &&
                amount < widget.maxExclusive)) {
              setState(
                () => _error =
                    'يجب أن يكون أكبر من ${widget.minExclusive} وأقل من ${widget.maxExclusive}',
              );
              return;
            }
            Navigator.of(context).pop(amount);
          },
          child: const Text('إرسال'),
        ),
      ],
    );
  }
}

extension<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

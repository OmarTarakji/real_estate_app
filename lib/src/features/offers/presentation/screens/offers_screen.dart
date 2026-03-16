import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:real_estate_app/src/features/offers/application/offers_state.dart';
import 'package:real_estate_app/src/features/offers/domain/offer_models.dart';
import 'package:real_estate_app/src/features/offers/presentation/screens/offer_thread_screen.dart';

class OffersScreen extends ConsumerWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final threads = ref.watch(offersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('العروض')),
      body: threads.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      LucideIcons.messagesSquare,
                      size: 56,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'لا توجد عروض حتى الآن',
                      style: theme.textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'قدّم عرضًا على أي عقار لبدء التفاوض',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                final t = threads[index];
                return _OfferThreadTile(thread: t);
              },
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemCount: threads.length,
            ),
    );
  }
}

class _OfferThreadTile extends StatelessWidget {
  const _OfferThreadTile({required this.thread});

  final OfferThread thread;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final last = thread.lastMessage;

    return Material(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => OfferThreadScreen(threadId: thread.id),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: _ThreadImage(imagePath: thread.propertyImage),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      thread.propertyTitle,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      last == null
                          ? 'ابدأ التفاوض بتقديم عرض'
                          : _subtitle(last),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    _InlineStatus(status: thread.status),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(LucideIcons.chevronLeft),
            ],
          ),
        ),
      ),
    );
  }

  String _subtitle(OfferMessage m) {
    if (m.amount != null) return '${m.text} - \$${m.amount}';
    return m.text;
  }
}

class _ThreadImage extends StatelessWidget {
  const _ThreadImage({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (imagePath.startsWith('assets/')) {
      return Image.asset(
        imagePath,
        width: 62,
        height: 62,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          width: 62,
          height: 62,
          color: Colors.grey[300],
          child: Icon(LucideIcons.imageOff, color: theme.colorScheme.primary),
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: imagePath,
      width: 62,
      height: 62,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        width: 62,
        height: 62,
        color: Colors.grey[300],
        child: const Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => Container(
        width: 62,
        height: 62,
        color: Colors.grey[300],
        child: Icon(LucideIcons.imageOff, color: theme.colorScheme.primary),
      ),
    );
  }
}

class _InlineStatus extends StatelessWidget {
  const _InlineStatus({required this.status});

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

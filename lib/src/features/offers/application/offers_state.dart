import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/src/features/offers/domain/offer_models.dart';
import 'package:real_estate_app/src/features/properties/domain/property_model.dart';

class OffersNotifier extends Notifier<List<OfferThread>> {
  static const String currentUserId = 'me';
  static const String currentUserName = 'أنا';

  @override
  List<OfferThread> build() {
    return <OfferThread>[];
  }

  OfferThread? threadById(String threadId) {
    try {
      return state.firstWhere((t) => t.id == threadId);
    } catch (_) {
      return null;
    }
  }

  OfferThread getOrCreateThreadForProperty({required Property property}) {
    final existing = state.where((t) => t.propertyId == property.id).toList();
    if (existing.isNotEmpty) return existing.first;

    final now = DateTime.now();
    final originalPrice = _parsePrice(property.price);
    final thread = OfferThread(
      id: 'thread_${now.microsecondsSinceEpoch}',
      propertyId: property.id,
      propertyTitle: property.title,
      propertyImage: property.primaryImage,
      originalPrice: originalPrice,
      ownerId: property.ownerId,
      ownerName: property.ownerName,
      buyerId: currentUserId,
      buyerName: currentUserName,
      status: OfferThreadStatus.negotiating,
      messages: const <OfferMessage>[],
      updatedAt: now,
    );

    state = <OfferThread>[thread, ...state];
    return thread;
  }

  int? lastOfferAmount(String threadId) {
    final thread = threadById(threadId);
    if (thread == null) return null;

    for (final m in thread.messages.reversed) {
      if (m.type == OfferMessageType.offer ||
          m.type == OfferMessageType.counterOffer) {
        return m.amount;
      }
    }

    return null;
  }

  void sendOffer({
    required String threadId,
    required int amount,
    required bool isCounter,
  }) {
    final idx = state.indexWhere((t) => t.id == threadId);
    if (idx < 0) return;

    final thread = state[idx];
    final now = DateTime.now();
    final msg = OfferMessage(
      id: 'msg_${now.microsecondsSinceEpoch}',
      threadId: threadId,
      senderId: currentUserId,
      senderName: currentUserName,
      type: isCounter ? OfferMessageType.counterOffer : OfferMessageType.offer,
      amount: amount,
      text: isCounter ? 'عرض مضاد' : 'عرض',
      createdAt: now,
    );

    final updated = thread.copyWith(
      messages: [...thread.messages, msg],
      updatedAt: now,
      status: OfferThreadStatus.negotiating,
    );

    state = [
      updated,
      ...[...state]..removeAt(idx),
    ];
  }

  void accept(String threadId) =>
      _setStatus(threadId, OfferThreadStatus.accepted);

  void reject(String threadId) =>
      _setStatus(threadId, OfferThreadStatus.rejected);

  void _setStatus(String threadId, OfferThreadStatus status) {
    final idx = state.indexWhere((t) => t.id == threadId);
    if (idx < 0) return;

    final thread = state[idx];
    final now = DateTime.now();

    final systemMsg = OfferMessage(
      id: 'msg_${now.microsecondsSinceEpoch}',
      threadId: threadId,
      senderId: 'system',
      senderName: 'النظام',
      type: OfferMessageType.system,
      amount: null,
      text: status == OfferThreadStatus.accepted
          ? 'تم قبول العرض'
          : 'تم رفض العرض',
      createdAt: now,
    );

    final updated = thread.copyWith(
      status: status,
      updatedAt: now,
      messages: [...thread.messages, systemMsg],
    );

    state = [
      updated,
      ...[...state]..removeAt(idx),
    ];
  }

  int _parsePrice(String raw) {
    final digitsOnly = raw.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(digitsOnly) ?? 0;
  }
}

final offersProvider = NotifierProvider<OffersNotifier, List<OfferThread>>(
  OffersNotifier.new,
);

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/src/features/notifications/domain/notification_model.dart';

class NotificationsNotifier extends Notifier<List<AppNotification>> {
  @override
  List<AppNotification> build() {
    final now = DateTime.now();
    return <AppNotification>[
      AppNotification(
        id: 'n1',
        type: AppNotificationType.offerReceived,
        title: 'عرض جديد',
        body: 'لديك عرض جديد على أحد العقارات',
        createdAt: now.subtract(const Duration(minutes: 15)),
        isRead: false,
      ),
      AppNotification(
        id: 'n2',
        type: AppNotificationType.counterOffer,
        title: 'عرض مضاد',
        body: 'تم اقتراح سعر جديد. راجع التفاوض.',
        createdAt: now.subtract(const Duration(hours: 3)),
        isRead: false,
      ),
      AppNotification(
        id: 'n3',
        type: AppNotificationType.system,
        title: 'تحديث',
        body: 'تم تحديث التطبيق بميزات جديدة (وضع تجريبي)',
        createdAt: now.subtract(const Duration(days: 1)),
        isRead: true,
      ),
    ];
  }

  int get unreadCount => state.where((n) => !n.isRead).length;

  void markRead(String id) {
    state = [
      for (final n in state)
        if (n.id == id) n.copyWith(isRead: true) else n,
    ];
  }

  void toggleRead(String id) {
    state = [
      for (final n in state)
        if (n.id == id) n.copyWith(isRead: !n.isRead) else n,
    ];
  }

  void markAllRead() {
    state = [for (final n in state) n.copyWith(isRead: true)];
  }

  void add(AppNotification notification) {
    state = [notification, ...state];
  }
}

final notificationsProvider =
    NotifierProvider<NotificationsNotifier, List<AppNotification>>(
  NotificationsNotifier.new,
);

final unreadNotificationsCountProvider = Provider<int>((ref) {
  ref.watch(notificationsProvider);
  return ref.read(notificationsProvider.notifier).unreadCount;
});

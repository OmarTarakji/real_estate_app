import 'package:flutter/foundation.dart';

enum AppNotificationType {
  offerReceived,
  offerAccepted,
  offerRejected,
  counterOffer,
  system,
}

@immutable
class AppNotification {
  const AppNotification({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.isRead,
  });

  final String id;
  final AppNotificationType type;
  final String title;
  final String body;
  final DateTime createdAt;
  final bool isRead;

  AppNotification copyWith({
    bool? isRead,
  }) {
    return AppNotification(
      id: id,
      type: type,
      title: title,
      body: body,
      createdAt: createdAt,
      isRead: isRead ?? this.isRead,
    );
  }
}

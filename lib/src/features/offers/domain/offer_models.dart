import 'package:flutter/foundation.dart';

enum OfferThreadStatus { negotiating, accepted, rejected }

enum OfferMessageType { offer, counterOffer, system }

@immutable
class OfferMessage {
  const OfferMessage({
    required this.id,
    required this.threadId,
    required this.senderId,
    required this.senderName,
    required this.type,
    this.amount,
    required this.text,
    required this.createdAt,
  });

  final String id;
  final String threadId;
  final String senderId;
  final String senderName;
  final OfferMessageType type;
  final int? amount;
  final String text;
  final DateTime createdAt;
}

@immutable
class OfferThread {
  const OfferThread({
    required this.id,
    required this.propertyId,
    required this.propertyTitle,
    required this.propertyImage,
    required this.originalPrice,
    required this.ownerId,
    required this.ownerName,
    required this.buyerId,
    required this.buyerName,
    required this.status,
    required this.messages,
    required this.updatedAt,
  });

  final String id;
  final String propertyId;
  final String propertyTitle;
  final String propertyImage;
  final int originalPrice;
  final String ownerId;
  final String ownerName;
  final String buyerId;
  final String buyerName;
  final OfferThreadStatus status;
  final List<OfferMessage> messages;
  final DateTime updatedAt;

  OfferMessage? get lastMessage => messages.isEmpty ? null : messages.last;

  OfferThread copyWith({
    OfferThreadStatus? status,
    List<OfferMessage>? messages,
    DateTime? updatedAt,
  }) {
    return OfferThread(
      id: id,
      propertyId: propertyId,
      propertyTitle: propertyTitle,
      propertyImage: propertyImage,
      originalPrice: originalPrice,
      ownerId: ownerId,
      ownerName: ownerName,
      buyerId: buyerId,
      buyerName: buyerName,
      status: status ?? this.status,
      messages: messages ?? this.messages,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

import 'dart:math' show Random;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:real_estate_app/src/utils/random.dart';

part 'property_model.freezed.dart';
part 'property_model.g.dart';

@freezed
abstract class Property with _$Property {
  const Property._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Property({
    required String id,
    required String ownerId,
    required String propertyTypeId,
    required String title,
    required String description,
    required String area,
    required String residents,
    required String bathrooms,
    required String bedrooms,
    required String isNegotiable,

    @JsonKey(fromJson: _transactionTypeFromJson)
    required String transactionType,

    required String price,
    required String views,
    required String status,
    required String createdAt,
    required String ownerName,
    required String typeName,
    required String streetName,
    required String region,

    required List<String> images,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  /// Computed properties

  String get areaString => '$area م²';

  String get primaryImage =>
      images.isNotEmpty ? images.first : getRandomImage();

  String get address => '$streetName، $region';
}

/// Custom JSON helpers

String _transactionTypeFromJson(String value) =>
    value == 'sale' ? 'للبيع' : 'للإيجار';

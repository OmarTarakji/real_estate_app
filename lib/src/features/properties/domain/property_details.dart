import 'package:real_estate_app/src/api/api_service.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'property_details.freezed.dart';
part 'property_details.g.dart';

@freezed
abstract class PropertyDetails with _$PropertyDetails {
  const PropertyDetails._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory PropertyDetails({
    required String id,
    required String title,
    required String description,
    required int pricePerNight,
    required String imageUrl,
    required int bedrooms,
    required int bathrooms,
    required int guests,
    required Landlord landlord,
  }) = _PropertyDetails;

  factory PropertyDetails.fromJson(Map<String, dynamic> json) =>
      _$PropertyDetailsFromJson(json);

  String get resolvedImageUrl =>
      imageUrl.replaceFirst('localhost', ApiService.ipAddress);
}

@freezed
abstract class Landlord with _$Landlord {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Landlord({
    required String id,
    String? name,
    String? avatarUrl,
  }) = _Landlord;

  factory Landlord.fromJson(Map<String, dynamic> json) =>
      _$LandlordFromJson(json);
}

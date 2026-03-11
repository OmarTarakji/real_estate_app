// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PropertyDetails _$PropertyDetailsFromJson(Map<String, dynamic> json) =>
    _PropertyDetails(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      pricePerNight: (json['price_per_night'] as num).toInt(),
      imageUrl: json['image_url'] as String,
      bedrooms: (json['bedrooms'] as num).toInt(),
      bathrooms: (json['bathrooms'] as num).toInt(),
      guests: (json['guests'] as num).toInt(),
      landlord: Landlord.fromJson(json['landlord'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertyDetailsToJson(_PropertyDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price_per_night': instance.pricePerNight,
      'image_url': instance.imageUrl,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'guests': instance.guests,
      'landlord': instance.landlord.toJson(),
    };

_Landlord _$LandlordFromJson(Map<String, dynamic> json) => _Landlord(
  id: json['id'] as String,
  name: json['name'] as String?,
  avatarUrl: json['avatar_url'] as String?,
);

Map<String, dynamic> _$LandlordToJson(_Landlord instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'avatar_url': instance.avatarUrl,
};

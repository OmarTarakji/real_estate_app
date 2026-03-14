// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Property _$PropertyFromJson(Map<String, dynamic> json) => _Property(
  id: json['id'] as String,
  ownerId: json['owner_id'] as String,
  propertyTypeId: json['property_type_id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  area: json['area'] as String,
  residents: json['residents'] as String,
  bathrooms: json['bathrooms'] as String,
  bedrooms: json['bedrooms'] as String,
  isNegotiable: json['is_negotiable'] as String,
  transactionType: _transactionTypeFromJson(json['transaction_type'] as String),
  price: json['price'] as String,
  views: json['views'] as String,
  status: json['status'] as String,
  createdAt: json['created_at'] as String,
  ownerName: json['owner_name'] as String,
  typeName: json['type_name'] as String,
  streetName: json['street_name'] as String,
  region: json['region'] as String,
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$PropertyToJson(_Property instance) => <String, dynamic>{
  'id': instance.id,
  'owner_id': instance.ownerId,
  'property_type_id': instance.propertyTypeId,
  'title': instance.title,
  'description': instance.description,
  'area': instance.area,
  'residents': instance.residents,
  'bathrooms': instance.bathrooms,
  'bedrooms': instance.bedrooms,
  'is_negotiable': instance.isNegotiable,
  'transaction_type': instance.transactionType,
  'price': instance.price,
  'views': instance.views,
  'status': instance.status,
  'created_at': instance.createdAt,
  'owner_name': instance.ownerName,
  'type_name': instance.typeName,
  'street_name': instance.streetName,
  'region': instance.region,
  'images': instance.images,
};

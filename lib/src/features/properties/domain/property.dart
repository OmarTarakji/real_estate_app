import 'dart:math' show Random;

class Property {
  final String id;
  final String ownerId;
  final String propertyTypeId;
  final String addressId;
  final String title;
  final String description;
  final String area;
  final String residents;
  final String bathrooms;
  final String bedrooms;
  final String isNegotiable;
  final String transactionType;
  final String price;
  final String views;
  final String status;
  final String createdAt;
  final String ownerName;
  final String ownerPhone;
  final String propertyType;
  final String streetName;
  final String region;
  final double latitude;
  final double longitude;
  final List<String> images;

  Property({
    required this.id,
    required this.ownerId,
    required this.propertyTypeId,
    required this.addressId,
    required this.title,
    required this.description,
    required this.area,
    required this.residents,
    required this.bathrooms,
    required this.bedrooms,
    required this.isNegotiable,
    required this.transactionType,
    required this.price,
    required this.views,
    required this.status,
    required this.createdAt,
    required this.ownerName,
    required this.ownerPhone,
    required this.propertyType,
    required this.streetName,
    required this.region,
    required this.latitude,
    required this.longitude,
    required this.images,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'] as String,
      ownerId: json['owner_id'] as String,
      propertyTypeId: json['property_type_id'] as String,
      addressId: json['address_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      area: json['area'] as String,
      residents: json['residents'] as String,
      bathrooms: json['bathrooms'] as String,
      bedrooms: json['bedrooms'] as String,
      isNegotiable: json['is_negotiable'] as String,
      transactionType: json['transaction_type'] == 'sale' ? 'للبيع' : 'للإيجار',
      price: json['price'] as String,
      views: json['views'] as String,
      status: json['status'] as String,
      createdAt: json['created_at'] as String,
      ownerName: json['owner_name'] as String,
      ownerPhone: json['owner_phone'] as String,
      propertyType: json['property_type'] as String,
      streetName: json['street_name'] as String,
      region: json['region'] as String,
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
      images: List<String>.from(json['images'] as List<dynamic>),
    );
  }

  String get areaString => '$area م²';
  String get primaryImage => images.isNotEmpty
      ? images[0]
      : 'https://picsum.photos/300/${200 + Random().nextInt(100)}';
  String get address => '$streetName، $region';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'owner_id': ownerId,
      'property_type_id': propertyTypeId,
      'address_id': addressId,
      'title': title,
      'description': description,
      'area': area,
      'residents': residents,
      'bathrooms': bathrooms,
      'bedrooms': bedrooms,
      'is_negotiable': isNegotiable,
      'transaction_type': transactionType,
      'price': price,
      'views': views,
      'status': status,
      'created_at': createdAt,
      'owner_name': ownerName,
      'owner_phone': ownerPhone,
      'property_type': propertyType,
      'street_name': streetName,
      'region': region,
      'latitude': latitude,
      'longitude': longitude,
      'images': images,
    };
  }
}

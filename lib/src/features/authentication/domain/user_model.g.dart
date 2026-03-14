// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  username: json['username'] as String,
  email: json['email'] as String,
  passwordHash: json['password_hash'] as String,
  phone: json['phone'] as String,
  description: json['description'] as String?,
  isActive: json['is_active'] as String,
  lastLogin: json['last_login'] as String,
  deletedAt: json['deleted_at'] as String?,
  dateJoined: json['date_joined'] as String,
  location: json['location'] as String?,
  avatar: json['avatar'] as String?,
  balance: json['balance'] as String,
  role: json['role'] as String,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'email': instance.email,
  'password_hash': instance.passwordHash,
  'phone': instance.phone,
  'description': instance.description,
  'is_active': instance.isActive,
  'last_login': instance.lastLogin,
  'deleted_at': instance.deletedAt,
  'date_joined': instance.dateJoined,
  'location': instance.location,
  'avatar': instance.avatar,
  'balance': instance.balance,
  'role': instance.role,
};

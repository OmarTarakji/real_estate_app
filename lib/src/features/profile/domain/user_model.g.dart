// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  username: json['username'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
  description: json['description'] as String?,
  isActive: json['is_active'] as String,
  lastLogin: json['last_login'] as String?,
  deletedAt: json['deleted_at'] as String?,
  dateJoined: json['date_joined'] as String,
  location: json['location'] as String?,
  avatar: json['avatar'] as String?,
  balance: json['balance'] as String,
  role: json['role'] as String,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
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

_UserResponse _$UserResponseFromJson(Map<String, dynamic> json) =>
    _UserResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: UserModel.fromJson(json['data'] as Map<String, dynamic>),
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$UserResponseToJson(_UserResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'timestamp': instance.timestamp,
    };

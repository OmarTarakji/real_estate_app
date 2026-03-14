// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: LoginData.fromJson(json['data'] as Map<String, dynamic>),
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'timestamp': instance.timestamp,
    };

_LoginData _$LoginDataFromJson(Map<String, dynamic> json) => _LoginData(
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  token: json['token'] as String,
  tokenType: json['token_type'] as String,
  expiresIn: (json['expires_in'] as num).toInt(),
);

Map<String, dynamic> _$LoginDataToJson(_LoginData instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
    };

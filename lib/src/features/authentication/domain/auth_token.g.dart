// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) => _AuthToken(
  token: json['token'] as String,
  expirationDate: DateTime.parse(json['expiration_date'] as String),
);

Map<String, dynamic> _$AuthTokenToJson(_AuthToken instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiration_date': instance.expirationDate.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PropertiesResponse _$PropertiesResponseFromJson(Map<String, dynamic> json) =>
    _PropertiesResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Property.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$PropertiesResponseToJson(_PropertiesResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'timestamp': instance.timestamp,
    };

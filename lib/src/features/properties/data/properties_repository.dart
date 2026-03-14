import 'package:dio/dio.dart';

import 'package:real_estate_app/src/features/properties/domain/property_model.dart';

import 'package:real_estate_app/src/features/properties/domain/properties_response.dart';

import 'package:real_estate_app/src/shared/data/network/api_end_point.dart';

import 'package:real_estate_app/src/shared/data/network/dio_provider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'properties_repository.g.dart';

class PropertiesRepository {
  PropertiesRepository(this._dio);

  final Dio _dio;

  Future<List<Property>> getProperties() async {
    final response = await _dio.get(ApiEndPoint.allProperties);

    final propertiesResponse = PropertiesResponse.fromJson(response.data);

    return propertiesResponse.data;
  }

  Future<Property> getProperty(String id) async {
    final response = await _dio.get(ApiEndPoint.property(id));

    return Property.fromJson(response.data as Map<String, dynamic>);
  }
}

@riverpod
PropertiesRepository propertiesRepository(Ref ref) {
  return PropertiesRepository(ref.read(dioProvider));
}

@riverpod
Future<List<Property>> properties(Ref ref) {
  final properties = ref.watch(propertiesRepositoryProvider).getProperties();
  ref.keepAlive();
  return properties;
}

@riverpod
Future<Property> property(Ref ref, String id) {
  return ref.watch(propertiesRepositoryProvider).getProperty(id);
}

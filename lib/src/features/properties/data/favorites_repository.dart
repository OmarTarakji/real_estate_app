import 'package:dio/dio.dart';
import 'package:real_estate_app/src/shared/data/network/api_end_point.dart';
import 'package:real_estate_app/src/shared/data/network/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/properties_response.dart';
import '../domain/property_model.dart';

part 'favorites_repository.g.dart';

class FavoritesRepository {
  const FavoritesRepository(this._dio);

  final Dio _dio;

  Future<List<Property>> getFavorites() async {
    final response = await _dio.get(ApiEndPoint.allProperties);

    final propertiesResponse = PropertiesResponse.fromJson(response.data);
    return propertiesResponse.data;
  }

  Future<void> toggleFavorite(String id) async {
    await _dio.post(ApiEndPoint.toggleFavorite(id));
  }
}

@riverpod
FavoritesRepository favoritesRepository(Ref ref) {
  return FavoritesRepository(ref.read(dioProvider));
}

@riverpod
Future<List<Property>> favorites(Ref ref) async {
  return ref.read(favoritesRepositoryProvider).getFavorites();
}

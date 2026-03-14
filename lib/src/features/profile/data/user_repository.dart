import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:real_estate_app/src/features/profile/domain/user_model.dart';
import 'package:real_estate_app/src/shared/data/network/api_end_point.dart';
import 'package:real_estate_app/src/shared/data/network/dio_provider.dart';

part 'user_repository.g.dart';

class UserRepository {
  const UserRepository(this._dio);

  final Dio _dio;

  Future<UserModel> getUserProfile() async {
    final response = await _dio.get(ApiEndPoint.me);
    final userResponse = UserResponse.fromJson(response.data);
    return userResponse.data;
  }

  Future<UserModel> updateProfile({String? username, String? phone}) async {
    final response = await _dio.put(
      ApiEndPoint.userProfile,
      data: {
        if (username != null) 'username': username,
        if (phone != null) 'phone': phone,
      },
    );
    return UserModel.fromJson(response.data);
  }

  Future<List<dynamic>> getUserFavorites() async {
    final response = await _dio.get(ApiEndPoint.userFavorites);
    return response.data as List<dynamic>;
  }

  Future<List<dynamic>> getUserNotifications() async {
    final response = await _dio.get(ApiEndPoint.userNotifications);
    return response.data as List<dynamic>;
  }

  Future<void> markNotificationsAsRead() async {
    await _dio.put(ApiEndPoint.markNotificationsRead);
  }
}

@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepository(ref.read(dioProvider));
}

@riverpod
Future<UserModel> currentUser(Ref ref) async {
  final repository = ref.read(userRepositoryProvider);
  return repository.getUserProfile();
}

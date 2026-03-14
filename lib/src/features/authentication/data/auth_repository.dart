import 'package:dio/dio.dart';
import 'package:real_estate_app/src/shared/data/network/api_end_point.dart';
import 'package:real_estate_app/src/shared/data/network/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/login_response.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  const AuthRepository(this._dio);

  final Dio _dio;

  Future<LoginResponse> login(String email, String password) async {
    final response = await _dio.post(
      ApiEndPoint.login,
      data: {'email': email, 'password': password},
    );

    final loginResponse = LoginResponse.fromJson(response.data);
    return loginResponse;
  }

  Future<LoginResponse> signup(
    String username,
    String email,
    String? phone,
    String password,
    String passwordConfirm,
  ) async {
    final response = await _dio.post(
      ApiEndPoint.signup,
      data: {
        'username': username,
        'email': email,
        'password': password,
        'password_confirm': passwordConfirm,
        'phone': phone,
      },
    );

    final loginResponse = LoginResponse.fromJson(response.data);
    return loginResponse;
  }
}

@riverpod
AuthRepository authRepository(Ref ref) => AuthRepository(ref.read(dioProvider));

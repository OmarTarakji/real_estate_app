import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:real_estate_app/src/features/authentication/data/auth_repository.dart';
import 'package:real_estate_app/src/features/authentication/domain/auth_state.dart';
import 'package:real_estate_app/src/features/authentication/domain/login_response.dart';
import 'package:real_estate_app/src/shared/data/network/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

@riverpod
class AuthServiceNotifier extends _$AuthServiceNotifier {
  final _storage = FlutterSecureStorage();

  @override
  Future<AuthState> build() async {
    final String? token = await _storage.read(key: 'login_data');
    if (token?.isEmpty ?? true) {
      return const Unauthenticated();
    } else {
      final loginData = LoginResponse.fromJson(jsonDecode(token!));
      return Authenticated(loginData);
    }
  }

  ///Return null on success
  ///Return an error message on error
  Future<String?> login(String email, String password) async {
    try {
      final loginResponse = await ref
          .read(authRepositoryProvider)
          .login(email, password);
      _saveLoginData(loginResponse);
    } catch (e, st) {
      debugPrint('LOG: Login error: $e');
      debugPrint(st.toString());
      return 'فشل تسجيل الدخول';
    }
    return null;
  }

  ///Return null on success
  ///Return an error message on error
  Future<String?> signup({
    required String username,
    required String email,
    required String password,
    required String passwordConfirm,
    required String phone,
  }) async {
    try {
      final loginResponse = await ref
          .read(authRepositoryProvider)
          .signup(username, email, password, passwordConfirm, phone);
      _saveLoginData(loginResponse);
    } catch (e) {
      debugPrint('LOG: Signup error: $e');
      return 'فشل إتشاء الحساب';
    }
    return null;
  }

  Future<void> _saveLoginData(LoginResponse loginData) async {
    await _storage.write(
      key: 'login_data',
      value: jsonEncode(loginData.toJson()),
    );
    state = AsyncData(Authenticated(loginData));
    ref.invalidate(dioProvider);
  }

  void logout() {
    _storage.delete(key: 'login_data');
    state = const AsyncData(Unauthenticated());
    ref.invalidate(dioProvider);
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:real_estate_app/src/utils/exceptions.dart';
import 'package:real_estate_app/src/features/authentication/domain/session.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/auth_service.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  final _storage = FlutterSecureStorage();
  final _authService = AuthService();

  @override
  Future<Session?> build() async {
    final Map<String, dynamic> json = jsonDecode(
      await _storage.read(key: 'session') ?? '{}',
    );
    if (json.isEmpty) {
      debugPrint('LOG: No session found');
      return null;
    }
    final session = Session.fromJson(json);
    if (session.isValid) {
      debugPrint('LOG: Session ends in ${session.expirationDate}');
      return session;
    }
    debugPrint('LOG: Session timed out');
    return null;
  }

  ///Return null on success
  ///Return an error message on error
  Future<String?> login(String email, String password) async {
    try {
      final session = await _authService.login(email, password);
      _storage.write(key: 'session', value: jsonEncode(session.toJson()));
      state = AsyncData(session);
    } on AuthException catch (e) {
      return e.message;
    } on ClientException catch (e) {
      return 'خطأ قي الاتصال: '
          '${e.message}';
    } catch (e, st) {
      debugPrint('LOG: Login error: $e');
      debugPrint(st.toString());
      return 'فشل تسجيل الدخول: خطأ غير معروف!';
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
    String? phone,
  }) async {
    try {
      final session = await _authService.signup(
        username,
        email,
        password,
        passwordConfirm,
        phone,
      );
      _storage.write(key: 'session', value: jsonEncode(session.toJson()));
      state = AsyncData(session);
    } on AuthException catch (e) {
      return e.message;
    } on ClientException catch (e) {
      return 'خطأ في الاتصال: '
          '${e.message}';
    } catch (e) {
      debugPrint('LOG: Signup error: $e');
      return 'فشل إتشاء الحساب: خطأ غير معروف!';
    }
    return null;
  }

  void logout() {
    if (state.asData?.value == null) return;
    debugPrint('LOG: Terminating session');
    _storage.delete(key: 'session');
    state = const AsyncData(null);
  }
}

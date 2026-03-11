import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate_app/src/api/api_service.dart';
import 'package:real_estate_app/src/utils/exceptions.dart';

import '../domain/session.dart';

class AuthService {
  Future<Session> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('${ApiService.baseUrl}/auth/login/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    debugPrint('LOG: Sign in:');
    debugPrint('LOG: ${response.body}');
    debugPrint('LOG: ${response.statusCode}');

    final body = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw AuthException(
        'فشل تسجيل الدخول: '
        '${body['message']}',
      );
    }
    return Session.fromJson(body['data']);
  }

  Future<Session> signup(
    String username,
    String email,
    String password,
    String passwordConfirm,
    String? phone,
  ) async {
    final response = await http.post(
      Uri.parse('${ApiService.baseUrl}/auth/register/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
        'password_confirm': passwordConfirm,
        'phone': phone,
      }),
    );
    debugPrint('LOG: Sign up:');
    debugPrint('LOG: ${response.body}');
    debugPrint('LOG: ${response.statusCode}');

    final body = jsonDecode(response.body);
    if (response.statusCode != 201) {
      throw AuthException(
        'فشل تسجيل الدخول: '
        '${body['errors'].values.first}',
      );
    }
    final session = Session.fromJson(body['data']);
    return session;
  }
}

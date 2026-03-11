import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../features/authentication/domain/session.dart';
import '../utils/exceptions.dart';

class ApiService {
  // static const String ipAddress = 'localhost';
  static const String ipAddress = '192.168.119.17';
  static const String baseUrl = 'http://$ipAddress:8080/api';
  final _storage = FlutterSecureStorage();

  Future<String?> get _token async {
    final Map<String, dynamic> json = jsonDecode(
      await _storage.read(key: 'session') ?? '{}',
    );
    if (json.isEmpty) return null;
    final session = Session.fromJson(json);
    if (!session.isValid) {
      throw const AuthException('Session expired, login is required.');
    }
    debugPrint(session.token);
    return session.token;
  }

  Future<http.Response> authGet(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    final token = await _token;
    final response = await http
        .get(url, headers: {'Authorization': 'Bearer $token'})
        .timeout(const Duration(seconds: 10));
    debugPrint(
      'LOG: response to $endpoint: Code: ${response.statusCode}, Body: ${response.body}',
    );
    return response;
  }

  Future<http.Response> authPost(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    return http
        .post(
          Uri.parse('$baseUrl/$endpoint'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $_token',
          },
          body: jsonEncode(data),
        )
        .timeout(const Duration(seconds: 10));
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'api_end_point.dart';
import 'auth_interceptor.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  final authInterceptor = ref.watch(authInterceptorProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
  // Add our custom interceptors
  dio.interceptors.addAll([
    authInterceptor, // The logic to add tokens and handle auth errors
    LogInterceptor(responseBody: true), // Useful for debugging
    if (!kReleaseMode)
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
  ]);

  return dio;
}

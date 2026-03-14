import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:real_estate_app/src/features/authentication/application/auth_service.dart';
import 'package:real_estate_app/src/features/authentication/domain/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_interceptor.g.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this.authState, {this.authServiceNotifier});

  final AuthState? authState;
  final AuthServiceNotifier? authServiceNotifier;

  String? get token => authState is Authenticated
      ? (authState as Authenticated).loginData.data.token
      : null;

  /// Checks if the error response indicates an authentication issue that requires sign-out
  bool _shouldSignOut(Map<String, dynamic>? responseData) {
    if (responseData == null) return false;

    final message = responseData['message'] as String?;
    final success = responseData['success'] as bool? ?? true;

    // Check for specific authentication error messages
    final authErrorMessages = [
      'الرمز المميز غير صحيح أو منتهي الصلاحية',
      'Token is invalid or expired',
      'Authentication failed',
      'Unauthorized access',
    ];

    return !success &&
        authErrorMessages.any(
          (errorMsg) =>
              message?.toLowerCase().contains(errorMsg.toLowerCase()) == true,
        );
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (authState != null && authState is Authenticated) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Check for authentication token error response
    if (err.response?.statusCode == 401) {
      try {
        final responseData = err.response?.data as Map<String, dynamic>?;

        if (_shouldSignOut(responseData)) {
          debugPrint('Auth: Authentication error detected, signing out user');
          debugPrint('Auth: Error message: ${responseData?['message']}');

          // Sign out the user if we have access to the auth service
          if (authState is Authenticated && authServiceNotifier != null) {
            authServiceNotifier!.logout();
          }
        }
      } catch (e) {
        debugPrint('Auth: Error parsing auth error response: $e');
      }
    }

    return handler.next(err);
  }
}

@riverpod
AuthInterceptor authInterceptor(Ref ref) {
  final authService = ref.watch(authServiceProvider);
  final authState = authService.value;

  return AuthInterceptor(
    authState,
    authServiceNotifier: ref.read(authServiceProvider.notifier),
  );
}

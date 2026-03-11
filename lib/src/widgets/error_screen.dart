import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:real_estate_app/src/utils/exceptions.dart';

class StyledError extends StatelessWidget {
  const StyledError({
    super.key,
    required this.onRetry,
    required this.error,
    this.stackTrace,
  });

  final VoidCallback onRetry;
  final Object? error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    if (error != null) debugPrint('LOG: $error');
    if (stackTrace != null) debugPrint('LOG: Stack Trace: $stackTrace');
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            size: 100,
            color: Theme.of(context).colorScheme.error,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          FilledButton.icon(
            onPressed: onRetry,
            label: const Text('Retry'),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }

  String get message {
    if (error is ApiException) return (error as ApiException).message;
    if (error is ClientException)
      return 'خطأ في الاتصال: تحقق من اتصالك بالشبكة ثم أعد المحاولة';
    if (error is TimeoutException)
      return 'تعذر الاتصال بالخادم: تحقق من اتصالك بالشبكة ثم أعد المحاولة';
    return error.toString();
  }
}

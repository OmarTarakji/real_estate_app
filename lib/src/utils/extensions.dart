import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void showErrorSnackBar(String s) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          s,
          style: TextStyle(color: Theme.of(this).colorScheme.onErrorContainer),
        ),
        backgroundColor: Theme.of(this).colorScheme.errorContainer,
      ),
    );
  }
}

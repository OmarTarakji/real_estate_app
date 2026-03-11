import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    super.key,
  });
  final String text;
  final Color? foregroundColor;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: foregroundColor ?? theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

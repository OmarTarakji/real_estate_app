import 'package:flutter/material.dart';

class PropertyPrice extends StatelessWidget {
  const PropertyPrice({required this.price, required this.type, super.key});

  final String price;
  final String type;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '\$${price}',
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (type == 'للإيجار')
            TextSpan(
              text: ' (شهرياً)',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
        ],
      ),
    );
  }
}

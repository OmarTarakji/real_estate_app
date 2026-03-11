import 'package:flutter/material.dart';

class PropertyFeature extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const PropertyFeature({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(24.0),
          ),
          alignment: Alignment.center,
          child: Icon(icon, color: theme.colorScheme.primary, size: 30),
        ),
        const SizedBox(height: 8.0),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 4.0),
        Text(label, style: TextStyle(color: theme.colorScheme.outline)),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({
    required this.icon,
    required this.text,
    this.color,
    super.key,
  });

  final IconData icon;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: color ?? theme.colorScheme.outline),
        const SizedBox(width: 8),
        Text(
          text,
          softWrap: false,
          overflow: TextOverflow.fade,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: color ?? theme.colorScheme.outline,
          ),
        ),
      ],
    );
  }
}

class ExpandedInfoTile extends StatelessWidget {
  const ExpandedInfoTile({
    required this.icon,
    required this.text,
    this.color,
    super.key,
  });

  final IconData icon;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: color ?? theme.colorScheme.outline),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: color ?? theme.colorScheme.outline,
            ),
          ),
        ),
      ],
    );
  }
}

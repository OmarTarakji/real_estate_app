import 'package:flutter/material.dart';
import 'package:real_estate_app/src/widgets/decorated_container.dart';

class DecoratedSection extends StatelessWidget {
  const DecoratedSection({
    required this.title,
    required this.children,
    super.key,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16.0),
          ...children,
        ],
      ),
    );
  }
}

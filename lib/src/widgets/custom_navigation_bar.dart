import 'package:flutter/material.dart';

import 'vertical_button.dart';

class CustomDestination {
  final IconData icon;
  final String label;

  const CustomDestination({required this.icon, required this.label});
}

abstract class CustomNavigation extends StatelessWidget {
  const CustomNavigation({
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final List<CustomDestination> destinations;
  final int selectedIndex;
  final void Function(int index) onDestinationSelected;

  List<VerticalButton> _buildButtons(BuildContext context, width) {
    return [
      for (final d in destinations)
        VerticalButton(
          icon: d.icon,
          label: d.label,
          width: width,
          onPressed: () => onDestinationSelected(destinations.indexOf(d)),
          color: selectedIndex == destinations.indexOf(d)
              ? Theme.of(context).colorScheme.primary
              : null,
        ),
    ];
  }
}

class CustomNavigationBar extends CustomNavigation {
  const CustomNavigationBar({
    required super.destinations,
    required super.selectedIndex,
    required super.onDestinationSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.outline.withAlpha(30),
          ),
          Ink(
            width: double.infinity,
            // height: 75,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth / destinations.length;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildButtons(context, width),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

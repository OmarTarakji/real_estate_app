import 'package:flutter/material.dart';
import 'package:real_estate_app/src/features/profile/presentation/profile_screen.dart';
import 'package:real_estate_app/src/features/properties/presentation/screens/favorites_screen.dart';
import 'package:real_estate_app/src/features/properties/presentation/screens/home_screen.dart';
import 'package:real_estate_app/src/widgets/custom_navigation_bar.dart';

class MainNavigationShell extends StatefulWidget {
  const MainNavigationShell({super.key});

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const screens = [HomePage(), FavoritesScreen(), ProfileScreen()];
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: CustomNavigationBar(
        destinations: _destination,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) =>
            setState(() => _selectedIndex = index),
      ),
    );
  }

  static const _destination = [
    CustomDestination(icon: Icons.home_outlined, label: 'Home'),
    CustomDestination(icon: Icons.favorite_outline_rounded, label: 'Favorites'),
    CustomDestination(icon: Icons.person_outline_rounded, label: 'Profile'),
  ];
}

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:real_estate_app/src/features/profile/presentation/profile_screen.dart';
import 'package:real_estate_app/src/features/listings/presentation/screens/add_listing_screen.dart';
import 'package:real_estate_app/src/features/offers/presentation/screens/offers_screen.dart';
import 'package:real_estate_app/src/features/properties/presentation/screens/home_screen.dart';
import 'package:real_estate_app/src/features/search/presentation/screens/search_screen.dart';

class MainNavigationShell extends StatefulWidget {
  const MainNavigationShell({super.key});

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screens = [
      HomePage(),
      const SearchScreen(),
      const AddListingScreen(),
      const OffersScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: colorScheme.outlineVariant, width: 1),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: GNav(
          color: colorScheme.onSurface,
          activeColor: colorScheme.primary,
          tabBackgroundColor: colorScheme.primaryContainer.withAlpha(100),
          rippleColor: colorScheme.primaryContainer.withAlpha(60),
          hoverColor: colorScheme.primaryContainer.withAlpha(40),
          tabBorderRadius: 16,
          gap: 8,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          duration: Duration(milliseconds: 400),
          tabs: [
            GButton(icon: LucideIcons.house, text: 'الرئيسية'),
            GButton(icon: LucideIcons.search, text: 'بحث'),
            GButton(icon: LucideIcons.plus, text: 'إضافة'),
            GButton(icon: LucideIcons.messageSquare, text: 'الرسائل'),
            GButton(icon: LucideIcons.user, text: 'الملف الشخصي'),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) => setState(() => _selectedIndex = index),
        ),
      ),
    );
  }
}

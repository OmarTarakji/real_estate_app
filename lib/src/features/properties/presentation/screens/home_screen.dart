import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../data/properties_repository.dart';
import 'favorites_screen.dart';
import '../widgets/error_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/property_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Hero Section as SliverAppBar
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      theme.colorScheme.primaryContainer,
                      theme.colorScheme.primaryContainer.withAlpha(230),
                    ],
                  ),
                ),
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'ابحث عن منزل أحلامك',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'أكثر من 1000 عقار بانتظارك',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const FavoritesScreen()),
                  );
                },
                icon: const Icon(LucideIcons.heart),
                tooltip: 'المفضلة',
              ),
            ],
          ),
          // Categories Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تصفح حسب النوع',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _CategoryCard('شقق', LucideIcons.building, theme),
                      const SizedBox(width: 12),
                      _CategoryCard('فلل', LucideIcons.house, theme),
                      const SizedBox(width: 12),
                      _CategoryCard('أراضي', LucideIcons.map, theme),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          // Featured Properties Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'عقارات مميزة',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to all properties
                    },
                    child: const Text('عرض الكل'),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          // Properties List - Now as a Sliver
          const PropertiesListSliver(),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard(this.title, this.icon, this.theme);

  final String title;
  final IconData icon;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: theme.colorScheme.secondary),
            const SizedBox(height: 8),
            Text(
              title,
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PropertiesListSliver extends ConsumerWidget {
  const PropertiesListSliver({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertiesAsync = ref.watch(propertiesProvider);

    return propertiesAsync.when(
      data: (properties) {
        if (properties.isEmpty) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(LucideIcons.building, size: 64),
                    SizedBox(height: 16),
                    Text('لا توجد عقارات متاحة'),
                  ],
                ),
              ),
            ),
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: PropertyCard(properties[index]),
              ),
              childCount: properties.length,
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return SliverToBoxAdapter(
          child: Container(
            height: 300,
            padding: const EdgeInsets.all(16),
            child: Center(
              child: StyledErrorWidget(
                error: error,
                onRetry: () => ref.invalidate(propertiesProvider),
              ),
            ),
          ),
        );
      },
      loading: () {
        return SliverToBoxAdapter(
          child: Container(
            height: 300,
            padding: const EdgeInsets.all(16),
            child: const Center(child: LoadingWidget()),
          ),
        );
      },
    );
  }
}

class PropertiesListTab extends ConsumerWidget {
  const PropertiesListTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertiesAsync = ref.watch(propertiesProvider);

    return propertiesAsync.when(
      data: (properties) {
        if (properties.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(LucideIcons.building, size: 64),
                SizedBox(height: 16),
                Text('لا توجد عقارات متاحة'),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async => ref.invalidate(propertiesProvider),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: properties.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: PropertyCard(properties[index]),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return StyledErrorWidget(
          error: error,
          onRetry: () => ref.invalidate(propertiesProvider),
        );
      },
      loading: () => const LoadingWidget(),
    );
  }
}

class FavoritesTab extends ConsumerWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(LucideIcons.heart, size: 64),
          SizedBox(height: 16),
          Text('المفضلة'),
          SizedBox(height: 8),
          Text(
            'سيتم عرض العقارات المفضلة هنا',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

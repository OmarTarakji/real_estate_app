import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../data/properties_repository.dart';
import '../../domain/property_model.dart';
import '../../application/favorites_state.dart';
import '../widgets/property_card.dart';
import '../widgets/error_widget.dart';
import '../widgets/loading_widget.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesIds = ref.watch(favoriteIdsProvider);
    final propertiesAsync = ref.watch(propertiesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('المفضلة')),
      body: propertiesAsync.when(
        data: (List<Property> properties) {
          final favoriteProperties = properties
              .where((p) => favoritesIds.contains(p.id))
              .toList();

          if (favoriteProperties.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LucideIcons.heart, size: 64),
                  SizedBox(height: 16),
                  Text('لا توجد عقارات مفضلة'),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: favoriteProperties.length,
            separatorBuilder: (_, _) => const SizedBox(height: 16),
            itemBuilder: (context, index) => PropertyCard(
              favoriteProperties[index],
              key: ValueKey('favorite_${favoriteProperties[index].id}'),
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: StyledErrorWidget(
              error: error,
              onRetry: () => ref.invalidate(propertiesProvider),
            ),
          );
        },
        loading: () => Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.topCenter,
          child: const LoadingWidget(),
        ),
      ),
    );
  }
}

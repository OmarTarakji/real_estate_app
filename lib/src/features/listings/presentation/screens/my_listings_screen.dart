import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:real_estate_app/src/features/properties/data/properties_repository.dart';
import 'package:real_estate_app/src/features/properties/presentation/widgets/property_card.dart';
import 'package:real_estate_app/src/features/properties/presentation/widgets/loading_widget.dart';
import 'package:real_estate_app/src/features/properties/presentation/widgets/error_widget.dart';

class MyListingsScreen extends ConsumerWidget {
  const MyListingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertiesAsync = ref.watch(propertiesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('إعلاناتي')),
      body: propertiesAsync.when(
        data: (properties) {
          final myListings = properties
              .where((p) => p.ownerId == 'me')
              .toList();

          if (myListings.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LucideIcons.building, size: 64),
                  SizedBox(height: 16),
                  Text('لا توجد إعلانات لديك بعد'),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(propertiesProvider),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: myListings.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: PropertyCard(myListings[index]),
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
      ),
    );
  }
}

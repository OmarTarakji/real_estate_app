import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:real_estate_app/src/features/properties/data/properties_repository.dart';
import 'package:real_estate_app/src/features/properties/presentation/widgets/property_card.dart';
import 'package:real_estate_app/src/features/properties/presentation/widgets/loading_widget.dart';
import 'package:real_estate_app/src/features/properties/presentation/widgets/error_widget.dart';
import 'package:real_estate_app/src/features/search/data/search_repository.dart';
import 'package:real_estate_app/src/features/search/domain/search_filters.dart';
import 'package:real_estate_app/src/features/properties/domain/property_model.dart';

class SearchResultsSection extends ConsumerWidget {
  const SearchResultsSection({
    super.key,
    required this.propertiesAsync,
    required this.filters,
    this.scrollController,
  });

  final AsyncValue<List<Property>> propertiesAsync;
  final SearchFilters filters;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return propertiesAsync.when(
      data: (properties) {
        final filteredProperties = SearchRepository().filterProperties(
          properties,
          filters,
        );

        if (filteredProperties.isEmpty) {
          return const EmptySearchResults();
        }

        return ListView.builder(
          controller: scrollController,
          padding: const EdgeInsets.all(16),
          itemCount: filteredProperties.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: PropertyCard(filteredProperties[index]),
            );
          },
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

class EmptySearchResults extends StatelessWidget {
  const EmptySearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(LucideIcons.searchX, size: 64),
          SizedBox(height: 16),
          Text('لا توجد نتائج'),
          Text('حاول تعديل الفلاتر أو البحث'),
        ],
      ),
    );
  }
}

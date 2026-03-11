import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/src/widgets/error_screen.dart';
import 'package:real_estate_app/src/widgets/loading_body.dart';

import '../../application/properties_provider.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertiesAsync = ref.watch(propertiesProvider);
    final notifier = ref.watch(propertiesProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Find your dream home')),
      body: propertiesAsync.when(
        data: (data) {
          // final fav = data.favorites;
          // return RefreshIndicator(
          //   onRefresh: notifier.refresh,
          //   child: fav.isEmpty
          //       ? const Center(
          //           child: Text(
          //             'You don\'t have any properties in your favorites',
          //           ),
          //         )
          //       : ListView.builder(
          //           itemCount: fav.length,
          //           itemBuilder: (context, index) {
          //             final property = data.data.firstWhere(
          //               (p) => p.id == fav[index],
          //             );
          //             return PropertyCard(property: property);
          //           },
          //         ),
          // );
        },
        error: (e, st) => Center(
          child: StyledError(error: e, stackTrace: st, onRetry: () {}),
        ),
        loading: () => LoadingBody('جاري تحميل قائمة العقارات...'),
      ),
    );
  }
}

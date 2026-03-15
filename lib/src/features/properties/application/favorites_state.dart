import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteIdsNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() => <String>{};

  bool isFavorite(String propertyId) => state.contains(propertyId);

  void toggle(String propertyId) {
    if (state.contains(propertyId)) {
      state = {...state}..remove(propertyId);
    } else {
      state = {...state, propertyId};
    }
  }
}

final favoriteIdsProvider = NotifierProvider<FavoriteIdsNotifier, Set<String>>(
  FavoriteIdsNotifier.new,
);

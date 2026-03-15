import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../application/favorites_state.dart';

class FavoriteToggle extends ConsumerWidget {
  const FavoriteToggle({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesIds = ref.watch(favoriteIdsProvider);
    final isFavorite = favoritesIds.contains(id);

    return GestureDetector(
      onTap: () => ref.read(favoriteIdsProvider.notifier).toggle(id),
      child: Container(
        margin: const EdgeInsets.all(6),
        height: 34,
        width: 34,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.black26,
          border: Border.all(color: Colors.white38),
        ),
        child: Icon(
          isFavorite ? LucideIcons.heart600 : LucideIcons.heart,
          size: 20,
          color: isFavorite ? Colors.redAccent : Colors.white,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/src/features/properties/data/properties_repository.dart';

// class FavoriteToggle extends ConsumerWidget {
//   final String id;

//   const FavoriteToggle({required this.id, super.key});

//   void onToggle() async {
//     try{

//     }
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final properties = ref.watch(propertiesProvider).asData!.value;
//     final isFavourite = properties.favorites.contains(id);
//     final notifier = ref.read(propertiesProvider.notifier);

//     return GestureDetector(
//       onTap: onToggle,
//       child: Container(
//         margin: const EdgeInsets.all(8),
//         height: 30,
//         width: 32,
//         decoration: BoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(8)),
//           color: colorScheme.surface.withAlpha(200),
//         ),
//         child: Icon(
//           size: 20,
//           Icons.favorite_outline_rounded,
//           color: isFavourite ? Colors.redAccent : colorScheme.outline,
//         ),
//       ),
//     );
//   }
// }

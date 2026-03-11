import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/src/widgets/info_tile.dart';
import 'package:real_estate_app/src/widgets/tag.dart';

import '../../domain/property.dart';
import '../screens/property_details_screen.dart';

class PropertyCard extends StatelessWidget {
  final Property property;
  const PropertyCard(this.property, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PropertyDetailsScreen(property),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: property.primaryImage,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.broken_image,
                        size: 48,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                // PositionedDirectional(
                //   top: 8,
                //   end: 8,
                //   child: FavoriteToggle(id: property.id),
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Tag(text: property.transactionType),
                      const SizedBox(width: 8),
                      Tag(
                        text: property.propertyType,
                        backgroundColor: theme.colorScheme.secondaryContainer,
                        foregroundColor: theme.colorScheme.secondary,
                      ),
                      const Spacer(),
                      InfoTile(
                        icon: Icons.remove_red_eye_outlined,
                        text: property.views,
                      ),
                    ],
                  ),
                  Text(
                    property.title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                  InfoTile(
                    icon: Icons.location_on_outlined,
                    text: property.address,
                  ),
                  Row(
                    spacing: 24,
                    children: [
                      InfoTile(
                        icon: Icons.bed_rounded,
                        text: property.bedrooms,
                      ),
                      InfoTile(
                        icon: Icons.bathtub_outlined,
                        text: property.bedrooms,
                      ),
                      InfoTile(
                        icon: Icons.crop_free_rounded,
                        text: property.areaString,
                      ),
                    ],
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: property.price,
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '   دولار أميركي (شهرياً)',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.outline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

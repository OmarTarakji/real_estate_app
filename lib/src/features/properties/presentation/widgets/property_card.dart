import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:real_estate_app/src/features/properties/presentation/widgets/property_price.dart';
import 'package:real_estate_app/src/widgets/decorated_container.dart';
import 'package:real_estate_app/src/widgets/info_tile.dart';
import 'package:real_estate_app/src/widgets/tag.dart';

import '../../domain/property_model.dart';
import '../screens/property_details_screen.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard(this.property, {super.key});

  final Property property;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PropertyDetailsScreen(property),
        ),
      ),
      child: DecoratedContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PropertyImage(
              imageUrl: property.primaryImage,
              transactionType: property.transactionType,
              typeName: property.typeName,
              theme: theme,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _PropertyTitle(
                    title: property.title,
                    views: property.views,
                    theme: theme,
                  ),
                  _PropertyInfo(
                    address: property.address,
                    bedrooms: property.bedrooms,
                    bathrooms: property.bathrooms,
                    theme: theme,
                  ),
                  PropertyPrice(
                    price: property.price,
                    type: property.transactionType,
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

class _PropertyImage extends StatelessWidget {
  const _PropertyImage({
    required this.imageUrl,
    required this.transactionType,
    required this.typeName,
    required this.theme,
  });

  final String imageUrl;
  final String transactionType;
  final String typeName;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          height: 150,
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
              LucideIcons.imageOff,
              size: 48,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        PositionedDirectional(
          top: 8,
          start: 8,
          end: 8,
          child: Row(
            children: [
              Tag(text: transactionType),
              const SizedBox(width: 8),
              Tag(
                text: typeName,
                backgroundColor: theme.colorScheme.secondaryContainer,
                foregroundColor: theme.colorScheme.secondary,
              ),
              const Spacer(),
              // TODO: Add favorite button here
            ],
          ),
        ),
      ],
    );
  }
}

class _PropertyTitle extends StatelessWidget {
  const _PropertyTitle({
    required this.title,
    required this.views,
    required this.theme,
  });

  final String title;
  final String views;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        InfoTile(icon: LucideIcons.eye, text: views),
      ],
    );
  }
}

class _PropertyInfo extends StatelessWidget {
  const _PropertyInfo({
    required this.address,
    required this.bedrooms,
    required this.bathrooms,
    required this.theme,
  });

  final String address;
  final String bedrooms;
  final String bathrooms;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 24,
      children: [
        InfoTile(icon: LucideIcons.mapPin, text: address),
        InfoTile(icon: LucideIcons.bed, text: bedrooms),
        InfoTile(icon: LucideIcons.bath, text: bathrooms),
      ],
    );
  }
}

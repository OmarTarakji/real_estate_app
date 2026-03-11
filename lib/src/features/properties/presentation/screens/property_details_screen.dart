import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/src/utils/extensions.dart';
import 'package:real_estate_app/src/widgets/info_tile.dart';
import 'package:real_estate_app/src/widgets/tag.dart';
import 'package:real_estate_app/src/features/properties/presentation/widgets/property_feature.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/property.dart';
import '../widgets/decorated_section.dart';

class PropertyDetailsScreen extends ConsumerWidget {
  final Property property;

  const PropertyDetailsScreen(this.property, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(
                  height: 300,
                  child: CarouselView.weighted(
                    flexWeights: const [8, 1],
                    children: List.generate(
                      5,
                      (index) => CachedNetworkImage(
                        // height: 300,
                        imageUrl: property.primaryImage,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey[300],
                          child: Icon(
                            Icons.broken_image,
                            size: 48,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        // actions: [FavoriteToggle(id: property.id)],
                      ),
                    ),
                  ),
                ),
                Text(
                  property.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    InfoTile(
                      icon: Icons.calendar_today_outlined,
                      text: 'أضيف بتاريخ ${property.createdAt.split(' ')[0]}',
                    ),
                    const SizedBox(width: 16.0),
                    InfoTile(
                      icon: Icons.remove_red_eye_outlined,
                      text: property.views,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Tag(text: property.propertyType),
                    const SizedBox(width: 8),
                    Tag(
                      text: property.transactionType,
                      backgroundColor: theme.colorScheme.secondaryContainer,
                      foregroundColor: theme.colorScheme.secondary,
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
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.attach_money_rounded),
                    label: const Text('تقديم عرض'),
                  ),
                ),
                DecoratedSection(
                  title: 'العنوان',
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(property.address)),
                        Spacer(),
                        TextButton.icon(
                          icon: Icon(Icons.map_rounded),
                          label: Text('عرض على الخريطة'),
                          onPressed: () => openMap(
                            context,
                            property.latitude,
                            property.longitude,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                DecoratedSection(
                  title: 'مواصفات العقار',
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PropertyFeature(
                          icon: Icons.bed_outlined,
                          label: 'غرف نوم',
                          value: property.bedrooms.toString(),
                        ),
                        PropertyFeature(
                          icon: Icons.bathtub_outlined,
                          label: 'حمامات',
                          value: property.bathrooms.toString(),
                        ),
                        PropertyFeature(
                          icon: Icons.crop_free_rounded,
                          label: 'المساحة',
                          value: property.area,
                        ),
                        PropertyFeature(
                          icon: Icons.people_outline,
                          label: 'عدد النزلاء',
                          value: property.residents,
                        ),
                      ],
                    ),
                  ],
                ),
                DecoratedSection(
                  title: 'وصف العقار',
                  children: [
                    Text(
                      property.description,
                      style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
                    ),
                  ],
                ),
                DecoratedSection(
                  title: 'معلومات المالك',
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: Text(
                              _initials,
                              style: const TextStyle(fontSize: 25),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            property.ownerName,
                            style: theme.textTheme.bodyLarge,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String get _initials {
    final parts = property.ownerName.split(' ');
    final namesLength = parts.length;
    if (namesLength > 1) return parts[0][0] + parts[1][0];

    return parts[0][0];
  }

  void openMap(BuildContext context, double latitude, double longitude) async {
    final String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    Uri uri = Uri.parse(googleMapsUrl);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (context.mounted) context.showErrorSnackBar('Could not launch $uri');
      //
      // final String webMapUrl = 'https://www.google.com/maps/@?api=1&map_action=map&center=$latitude,$longitude';
      // Uri webUri = Uri.parse(webMapUrl);
      // if (await canLaunchUrl(webUri)) {
      //   await launchUrl(webUri);
      // } else {
      //   throw 'Could not launch any map URI';
      // }
    }
  }
}

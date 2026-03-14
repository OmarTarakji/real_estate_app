import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:real_estate_app/src/features/properties/presentation/widgets/property_price.dart';
import 'package:real_estate_app/src/utils/random.dart';
import 'package:real_estate_app/src/widgets/info_tile.dart';
import 'package:real_estate_app/src/widgets/tag.dart';
import 'package:real_estate_app/src/features/properties/presentation/widgets/property_feature.dart';

import '../../domain/property_model.dart';
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
                    itemSnapping: true,
                    flexWeights: const [12, 1],
                    shape: RoundedRectangleBorder(
                      borderRadius: .all(.circular(10)),
                    ),
                    children: List.generate(
                      5,
                      (index) => CachedNetworkImage(
                        // height: 300,
                        // imageUrl: property.primaryImage,
                        imageUrl: getRandomImage(),
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
                            LucideIcons.imageOff,
                            size: 64,
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
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    InfoTile(
                      icon: LucideIcons.calendar,
                      text: 'أضيف بتاريخ ${property.createdAt.split(' ')[0]}',
                    ),
                    const SizedBox(width: 16.0),
                    InfoTile(icon: LucideIcons.eye, text: property.views),
                  ],
                ),
                Row(
                  children: [
                    Tag(text: property.typeName),
                    const SizedBox(width: 8),
                    Tag(
                      text: property.transactionType,
                      backgroundColor: theme.colorScheme.secondaryContainer,
                      foregroundColor: theme.colorScheme.secondary,
                    ),
                  ],
                ),
                PropertyPrice(
                  price: property.price,
                  type: property.transactionType,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(LucideIcons.dollarSign),
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
                          icon: Icon(LucideIcons.map),
                          label: Text('عرض على الخريطة'),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('ميزة الخريطة قيد التطوير'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
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
                          icon: LucideIcons.bed,
                          label: 'غرف نوم',
                          value: property.bedrooms.toString(),
                        ),
                        PropertyFeature(
                          icon: LucideIcons.bath,
                          label: 'حمامات',
                          value: property.bathrooms.toString(),
                        ),
                        PropertyFeature(
                          icon: LucideIcons.maximize2,
                          label: 'المساحة',
                          value: property.area,
                        ),
                        PropertyFeature(
                          icon: LucideIcons.users,
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
}

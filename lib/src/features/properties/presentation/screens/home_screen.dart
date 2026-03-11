import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/src/widgets/error_screen.dart';

import '../../application/properties_provider.dart';
import '../../domain/property.dart';
import '../widgets/property_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagination = ref.watch(propertiesProvider);
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: theme.colorScheme.primary.withAlpha(20),
              floating: true,
              snap: true,
              expandedHeight:
                  250.0, // Added expandedHeight to make it expandable
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'ابحث عن عقار...',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white.withAlpha(200),
                        ),
                      ),
                      Row(
                        spacing: 12,
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                hintText: 'نوع العقار',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white.withAlpha(200),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 15.0,
                                ),
                              ),
                              items: <String>['منزل', 'أرض', 'محل تجاري'].map((
                                String value,
                              ) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {},
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                hintText: 'للبيع\\للإيجار',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white.withAlpha(200),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 15.0,
                                ),
                              ),
                              items:
                                  <String>[
                                    'بيع',
                                    'إيجار (يومي)',
                                    'إيجار (شهري)',
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                              onChanged: (String? newValue) {},
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 12,
                        children: [
                          FilledButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.search),
                            label: Text('بحث'),
                          ),
                          OutlinedButton.icon(
                            onPressed: () {},
                            label: const Text('بحث متقدّم'),
                            icon: Icon(Icons.tune),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'الكل'),
                  Tab(text: 'المفضلة'),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                final List<Property> properties = ref.watch(
                  propertiesListProvider,
                );
                if (index < properties.length) {
                  return PropertyCard(properties[index]);
                } else if (index == properties.length) {
                  return pagination.when(
                    data: (page) {
                      if (page.hasNext) {
                        return FilledButton(
                          onPressed: () {},
                          child: const Text('تحميل المزيد'),
                        );
                      }
                      return Text(
                        'تم عرض '
                        '${page.totalItems}'
                        ' من العقارات',
                      );
                    },
                    error: (e, st) => StyledError(
                      onRetry: () => ref.invalidate(propertiesProvider),
                      error: e,
                      stackTrace: st,
                    ),
                    loading: () => Container(
                      height: 100,
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 12),
                          Text('جاري تحميل العناصر...'),
                        ],
                      ),
                    ),
                  );
                }
                return null;
              }, childCount: ref.watch(propertiesListProvider).length + 1),
            ),
          ],
        ),
      ),
    );
  }
}

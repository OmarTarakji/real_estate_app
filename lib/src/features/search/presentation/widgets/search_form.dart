import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'advanced_filters_section.dart';

class SearchForm extends ConsumerStatefulWidget {
  const SearchForm({
    super.key,
    required this.searchController,
    required this.onSearch,
    required this.onCollapse,
    this.selectedPropertyType,
    this.selectedTransactionType,
    this.minPrice,
    this.maxPrice,
    this.minBedrooms,
    this.maxBedrooms,
    this.minBathrooms,
    this.maxBathrooms,
    this.minArea,
    this.maxArea,
  });

  final TextEditingController searchController;
  final VoidCallback onSearch;
  final VoidCallback onCollapse;
  final String? selectedPropertyType;
  final String? selectedTransactionType;
  final double? minPrice;
  final double? maxPrice;
  final int? minBedrooms;
  final int? maxBedrooms;
  final int? minBathrooms;
  final int? maxBathrooms;
  final double? minArea;
  final double? maxArea;

  @override
  ConsumerState<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends ConsumerState<SearchForm> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withAlpha(20),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Column(
        spacing: 6,
        mainAxisSize: MainAxisSize.min,
        children: [
          _SearchInput(controller: widget.searchController),
          const SizedBox(height: 8),
          _FiltersRow(
            propertyType: widget.selectedPropertyType,
            transactionType: widget.selectedTransactionType,
          ),
          const SizedBox(height: 8),
          _AdvancedFiltersSection(
            minPrice: widget.minPrice,
            maxPrice: widget.maxPrice,
            minBedrooms: widget.minBedrooms,
            maxBedrooms: widget.maxBedrooms,
            minBathrooms: widget.minBathrooms,
            maxBathrooms: widget.maxBathrooms,
            minArea: widget.minArea,
            maxArea: widget.maxArea,
          ),
          const SizedBox(height: 8),
          _SearchButton(
            onPressed: () {
              widget.onSearch();
              widget.onCollapse();
            },
          ),
        ],
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  const _SearchInput({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        hintText: 'ابحث عن عقار...',
        prefixIcon: Icon(LucideIcons.search, size: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}

class _FiltersRow extends StatelessWidget {
  const _FiltersRow({
    required this.propertyType,
    required this.transactionType,
  });

  final String? propertyType;
  final String? transactionType;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            initialValue: propertyType,
            isExpanded: true,
            decoration: const InputDecoration(
              hintText: 'نوع العقار',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              prefixIcon: Icon(LucideIcons.house, size: 16),
            ),
            items: const ['الكل', 'شقة', 'منزل', 'أرض', 'محل تجاري', 'فيلا']
                .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value == 'الكل' ? null : value,
                    child: Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  );
                })
                .toList(),
            onChanged: (String? newValue) {
              // This will be handled by parent
            },
          ),
        ),
        Expanded(
          child: DropdownButtonFormField<String>(
            initialValue: transactionType,
            isExpanded: true,
            decoration: const InputDecoration(
              hintText: 'للبيع/للإيجار',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              prefixIcon: Icon(LucideIcons.tag, size: 16),
            ),
            items: const ['الكل', 'للبيع', 'للإيجار'].map((String value) {
              return DropdownMenuItem<String>(
                value: value == 'الكل' ? null : value,
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // This will be handled by parent
            },
          ),
        ),
      ],
    );
  }
}

class _AdvancedFiltersSection extends StatelessWidget {
  const _AdvancedFiltersSection({
    required this.minPrice,
    required this.maxPrice,
    required this.minBedrooms,
    required this.maxBedrooms,
    required this.minBathrooms,
    required this.maxBathrooms,
    required this.minArea,
    required this.maxArea,
  });

  final double? minPrice;
  final double? maxPrice;
  final int? minBedrooms;
  final int? maxBedrooms;
  final int? minBathrooms;
  final int? maxBathrooms;
  final double? minArea;
  final double? maxArea;

  @override
  Widget build(BuildContext context) {
    return AdvancedFiltersSection(
      minPrice: minPrice,
      maxPrice: maxPrice,
      minBedrooms: minBedrooms,
      maxBedrooms: maxBedrooms,
      minBathrooms: minBathrooms,
      maxBathrooms: maxBathrooms,
      minArea: minArea,
      maxArea: maxArea,
    );
  }
}

class _SearchButton extends StatelessWidget {
  const _SearchButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: const Icon(LucideIcons.search, size: 16),
        label: const Text('بحث'),
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }
}

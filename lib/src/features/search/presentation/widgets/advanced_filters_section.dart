import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AdvancedFiltersSection extends ConsumerStatefulWidget {
  const AdvancedFiltersSection({
    super.key,
    this.minPrice,
    this.maxPrice,
    this.minBedrooms,
    this.maxBedrooms,
    this.minBathrooms,
    this.maxBathrooms,
    this.minArea,
    this.maxArea,
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
  ConsumerState<AdvancedFiltersSection> createState() =>
      _AdvancedFiltersSectionState();
}

class _AdvancedFiltersSectionState
    extends ConsumerState<AdvancedFiltersSection> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Row(
        children: [
          Icon(LucideIcons.settings, size: 18),
          SizedBox(width: 6),
          Text('فلترة متقدمة'),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      tilePadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      childrenPadding: const EdgeInsets.all(12),
      expandedAlignment: Alignment.topLeft,
      children: [
        Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Price Range
            FilterRangeRow(
              title: 'السعر',
              icon: LucideIcons.dollarSign,
              hintText1: 'السعر الأدنى',
              hintText2: 'السعر الأعلى',
              keyboardType: TextInputType.number,
              value1: widget.minPrice?.toString(),
              value2: widget.maxPrice?.toString(),
            ),

            // Bedrooms Range
            FilterRangeRow(
              title: 'غرف نوم',
              icon: LucideIcons.bed,
              hintText1: 'غرف نوم (أدنى)',
              hintText2: 'غرف نوم (أعلى)',
              keyboardType: TextInputType.number,
              value1: widget.minBedrooms?.toString(),
              value2: widget.maxBedrooms?.toString(),
            ),

            // Bathrooms Range
            FilterRangeRow(
              title: 'حمامات',
              icon: LucideIcons.bath,
              hintText1: 'حمامات (أدنى)',
              hintText2: 'حمامات (أعلى)',
              keyboardType: TextInputType.number,
              value1: widget.minBathrooms?.toString(),
              value2: widget.maxBathrooms?.toString(),
            ),

            // Area Range
            FilterRangeRow(
              title: 'المساحة',
              icon: LucideIcons.maximize2,
              hintText1: 'المساحة (أدنى)',
              hintText2: 'المساحة (أعلى)',
              keyboardType: TextInputType.number,
              value1: widget.minArea?.toString(),
              value2: widget.maxArea?.toString(),
            ),
          ],
        ),
      ],
    );
  }
}

class FilterRangeRow extends StatelessWidget {
  const FilterRangeRow({
    super.key,
    required this.title,
    required this.icon,
    required this.hintText1,
    required this.hintText2,
    required this.keyboardType,
    this.value1,
    this.value2,
    this.onChanged1,
    this.onChanged2,
  });

  final String title;
  final IconData icon;
  final String hintText1;
  final String hintText2;
  final TextInputType keyboardType;
  final String? value1;
  final String? value2;
  final Function(String)? onChanged1;
  final Function(String)? onChanged2;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        Expanded(
          child: TextField(
            controller: TextEditingController(text: value1),
            decoration: InputDecoration(
              hintText: hintText1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              prefixIcon: Icon(icon, size: 14),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
            ),
            keyboardType: keyboardType,
            onChanged: onChanged1,
          ),
        ),
        Expanded(
          child: TextField(
            controller: TextEditingController(text: value2),
            decoration: InputDecoration(
              hintText: hintText2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              prefixIcon: Icon(icon, size: 14),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
            ),
            keyboardType: keyboardType,
            onChanged: onChanged2,
          ),
        ),
      ],
    );
  }
}

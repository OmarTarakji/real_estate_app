import 'package:flutter/material.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final _searchController = TextEditingController();
  String? _selectedPropertyType;
  String? _selectedTransactionType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12,
      children: [
        TextField(
          controller: _searchController,
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
                value: _selectedPropertyType,
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
                items: const <String>['الكل', 'شقة', 'منزل', 'أرض', 'محل تجاري'].map(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedPropertyType = newValue;
                  });
                },
              ),
            ),
            Expanded(
              child: DropdownButtonFormField<String>(
                value: _selectedTransactionType,
                decoration: InputDecoration(
                  hintText: 'للبيع/للإيجار',
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
                items: const <String>[
                  'الكل',
                  'للبيع',
                  'للإيجار',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTransactionType = newValue;
                  });
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            FilledButton.icon(
              onPressed: _performSearch,
              icon: const Icon(Icons.search),
              label: const Text('بحث'),
            ),
            OutlinedButton.icon(
              onPressed: _showAdvancedSearch,
              label: const Text('بحث متقدّم'),
              icon: const Icon(Icons.tune),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _performSearch() {
    // TODO: Implement search functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('سيتم تطبيق البحث قريباً'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showAdvancedSearch() {
    // TODO: Implement advanced search
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('البحث المتقدم قيد التطوير'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

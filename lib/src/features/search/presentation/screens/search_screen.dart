import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:real_estate_app/src/features/properties/data/properties_repository.dart';
import 'package:real_estate_app/src/features/search/domain/search_filters.dart';

import '../widgets/search_form.dart';
import '../widgets/search_results_section.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen>
    with TickerProviderStateMixin {
  final _searchController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<double> _fadeAnimation;

  bool _isSearchVisible = true;

  String? _selectedPropertyType;
  String? _selectedTransactionType;
  double? _minPrice;
  double? _maxPrice;
  int? _minBedrooms;
  int? _maxBedrooms;
  int? _minBathrooms;
  int? _maxBathrooms;
  double? _minArea;
  double? _maxArea;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _sizeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  void _toggleSearch() => _isSearchVisible ? _hideSearch() : _showSearch();

  void _hideSearch() {
    if (_isSearchVisible) {
      setState(() => _isSearchVisible = false);
      _animationController.forward();
    }
  }

  void _showSearch() {
    if (!_isSearchVisible) {
      setState(() => _isSearchVisible = true);
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final propertiesAsync = ref.watch(propertiesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('بحث'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: _toggleSearch,
            icon: const Icon(LucideIcons.slidersHorizontal),
            tooltip: _isSearchVisible ? 'إخفاء الفلاتر' : 'إظهار الفلاتر',
          ),
        ],
      ),
      body: Column(
        children: [
          _AnimatedSearchSection(
            isVisible: _isSearchVisible,
            sizeAnimation: _sizeAnimation,
            fadeAnimation: _fadeAnimation,
            child: SearchForm(
              searchController: _searchController,
              onSearch: _performSearch,
              onCollapse: _hideSearch,
              selectedPropertyType: _selectedPropertyType,
              selectedTransactionType: _selectedTransactionType,
              minPrice: _minPrice,
              maxPrice: _maxPrice,
              minBedrooms: _minBedrooms,
              maxBedrooms: _maxBedrooms,
              minBathrooms: _minBathrooms,
              maxBathrooms: _maxBathrooms,
              minArea: _minArea,
              maxArea: _maxArea,
            ),
          ),
          Expanded(
            child: SearchResultsSection(
              propertiesAsync: propertiesAsync,
              filters: SearchFilters(
                query: _searchController.text,
                propertyType: _selectedPropertyType,
                transactionType: _selectedTransactionType,
                minPrice: _minPrice,
                maxPrice: _maxPrice,
                minBedrooms: _minBedrooms,
                maxBedrooms: _maxBedrooms,
                minBathrooms: _minBathrooms,
                maxBathrooms: _maxBathrooms,
                minArea: _minArea,
                maxArea: _maxArea,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _performSearch() => setState(() {}); // Trigger rebuild to apply filters
}

class _AnimatedSearchSection extends StatelessWidget {
  const _AnimatedSearchSection({
    required this.isVisible,
    required this.sizeAnimation,
    required this.fadeAnimation,
    required this.child,
  });

  final bool isVisible;
  final Animation<double> sizeAnimation;
  final Animation<double> fadeAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: sizeAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: IgnorePointer(ignoring: !isVisible, child: child),
      ),
    );
  }
}

class SearchFilters {
  const SearchFilters({
    this.query,
    this.propertyType,
    this.transactionType,
    this.minPrice,
    this.maxPrice,
    this.minBedrooms,
    this.maxBedrooms,
    this.minBathrooms,
    this.maxBathrooms,
    this.minArea,
    this.maxArea,
  });

  final String? query;
  final String? propertyType;
  final String? transactionType;
  final double? minPrice;
  final double? maxPrice;
  final int? minBedrooms;
  final int? maxBedrooms;
  final int? minBathrooms;
  final int? maxBathrooms;
  final double? minArea;
  final double? maxArea;

  bool get hasActiveFilters => 
      query?.isNotEmpty == true ||
      propertyType?.isNotEmpty == true ||
      transactionType?.isNotEmpty == true ||
      minPrice != null ||
      maxPrice != null ||
      minBedrooms != null ||
      maxBedrooms != null ||
      minBathrooms != null ||
      maxBathrooms != null ||
      minArea != null ||
      maxArea != null;
}

import 'package:real_estate_app/src/features/properties/domain/property_model.dart';
import 'package:real_estate_app/src/features/search/domain/search_filters.dart';

class SearchRepository {
  List<Property> filterProperties(
    List<Property> properties,
    SearchFilters filters,
  ) {
    return properties.where((property) {
      // Query filter
      if (filters.query?.isNotEmpty == true) {
        final query = filters.query!.toLowerCase();
        final titleMatch = property.title.toLowerCase().contains(query);
        final addressMatch = property.address.toLowerCase().contains(query);
        final descriptionMatch = property.description.toLowerCase().contains(
          query,
        );
        if (!titleMatch && !addressMatch && !descriptionMatch) {
          return false;
        }
      }

      // Property type filter
      if (filters.propertyType?.isNotEmpty == true) {
        if (property.typeName != filters.propertyType) {
          return false;
        }
      }

      // Transaction type filter
      if (filters.transactionType?.isNotEmpty == true) {
        if (property.transactionType != filters.transactionType) {
          return false;
        }
      }

      // Price filter
      if (filters.minPrice != null) {
        if (double.tryParse(property.price) == null ||
            double.parse(property.price) < filters.minPrice!) {
          return false;
        }
      }
      if (filters.maxPrice != null) {
        if (double.tryParse(property.price) == null ||
            double.parse(property.price) > filters.maxPrice!) {
          return false;
        }
      }

      // Bedrooms filter
      if (filters.minBedrooms != null) {
        final bedrooms = int.tryParse(property.bedrooms);
        if (bedrooms == null || bedrooms < filters.minBedrooms!) {
          return false;
        }
      }
      if (filters.maxBedrooms != null) {
        final bedrooms = int.tryParse(property.bedrooms);
        if (bedrooms == null || bedrooms > filters.maxBedrooms!) {
          return false;
        }
      }

      // Bathrooms filter
      if (filters.minBathrooms != null) {
        final bathrooms = int.tryParse(property.bathrooms);
        if (bathrooms == null || bathrooms < filters.minBathrooms!) {
          return false;
        }
      }
      if (filters.maxBathrooms != null) {
        final bathrooms = int.tryParse(property.bathrooms);
        if (bathrooms == null || bathrooms > filters.maxBathrooms!) {
          return false;
        }
      }

      // Area filter
      if (filters.minArea != null) {
        final area = double.tryParse(property.area);
        if (area == null || area < filters.minArea!) {
          return false;
        }
      }
      if (filters.maxArea != null) {
        final area = double.tryParse(property.area);
        if (area == null || area > filters.maxArea!) {
          return false;
        }
      }

      return true;
    }).toList();
  }
}

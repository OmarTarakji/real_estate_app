import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/src/api/api_service.dart';
import 'package:real_estate_app/src/features/properties/domain/property_details.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'property_details_provider.g.dart';

@riverpod
Future<PropertyDetails> propertyDetails(Ref ref, String id) async {
  final apiService = ApiService();

  final response = await apiService.authGet('properties/$id');
  if (response.statusCode != 200) {
    debugPrint(response.body);
    throw Exception(response.body);
  }

  return PropertyDetails.fromJson(jsonDecode(response.body));
}

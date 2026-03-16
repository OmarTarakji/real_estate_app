import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:real_estate_app/src/features/properties/domain/property_model.dart';
import 'package:real_estate_app/src/shared/mock/mock_properties.dart';

class MockPropertiesNotifier extends Notifier<List<Property>> {
  @override
  List<Property> build() => buildMockProperties();

  void addProperty(Property property) {
    state = [property, ...state];
  }
}

final mockPropertiesProvider =
    NotifierProvider<MockPropertiesNotifier, List<Property>>(
  MockPropertiesNotifier.new,
);

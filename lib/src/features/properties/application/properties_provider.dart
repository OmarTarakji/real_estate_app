import 'package:real_estate_app/src/providers/api_service_provider.dart';
import 'package:real_estate_app/src/features/properties/domain/property.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/pagination.dart';

part 'properties_provider.g.dart';

@riverpod
class PropertiesList extends _$PropertiesList {
  @override
  List<Property> build() {
    return [];
  }

  void setValue(List<Property> properties) => state = properties;
}

@riverpod
class PropertiesNotifier extends _$PropertiesNotifier {
  late final _api = ref.watch(apiProvider.notifier);
  @override
  Future<Pagination> build() async {
    return initialize();
  }

  Future<Pagination> initialize() async {
    final response = await _api.authGet('properties/');

    final List<dynamic> items = response['items'];
    ref
        .read(propertiesListProvider.notifier)
        .setValue(
          items
              .map((item) => Property.fromJson(item as Map<String, dynamic>))
              .toList(),
        );
    return Pagination.fromJson(response['pagination']);
  }

  Future<void> retry() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(initialize);
  }

  // void loadMore() {
  //   if(state.asData?.value.hasNext ?? false)
  //
  // }
}

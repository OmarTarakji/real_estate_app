import 'package:freezed_annotation/freezed_annotation.dart';
import 'property_model.dart';

part 'properties_response.freezed.dart';
part 'properties_response.g.dart';

@freezed
abstract class PropertiesResponse with _$PropertiesResponse {
  const factory PropertiesResponse({
    required bool success,
    required String message,
    required List<Property> data,
    required String timestamp,
  }) = _PropertiesResponse;

  factory PropertiesResponse.fromJson(Map<String, dynamic> json) =>
      _$PropertiesResponseFromJson(json);
}

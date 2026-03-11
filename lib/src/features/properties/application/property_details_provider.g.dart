// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(propertyDetails)
final propertyDetailsProvider = PropertyDetailsFamily._();

final class PropertyDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<PropertyDetails>,
          PropertyDetails,
          FutureOr<PropertyDetails>
        >
    with $FutureModifier<PropertyDetails>, $FutureProvider<PropertyDetails> {
  PropertyDetailsProvider._({
    required PropertyDetailsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'propertyDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$propertyDetailsHash();

  @override
  String toString() {
    return r'propertyDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PropertyDetails> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PropertyDetails> create(Ref ref) {
    final argument = this.argument as String;
    return propertyDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PropertyDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$propertyDetailsHash() => r'2d58d306c4ad3158a41d0192e48f015b563f6a30';

final class PropertyDetailsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<PropertyDetails>, String> {
  PropertyDetailsFamily._()
    : super(
        retry: null,
        name: r'propertyDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PropertyDetailsProvider call(String id) =>
      PropertyDetailsProvider._(argument: id, from: this);

  @override
  String toString() => r'propertyDetailsProvider';
}

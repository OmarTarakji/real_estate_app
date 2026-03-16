// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(propertiesRepository)
final propertiesRepositoryProvider = PropertiesRepositoryProvider._();

final class PropertiesRepositoryProvider
    extends
        $FunctionalProvider<
          PropertiesRepository,
          PropertiesRepository,
          PropertiesRepository
        >
    with $Provider<PropertiesRepository> {
  PropertiesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'propertiesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$propertiesRepositoryHash();

  @$internal
  @override
  $ProviderElement<PropertiesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PropertiesRepository create(Ref ref) {
    return propertiesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PropertiesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PropertiesRepository>(value),
    );
  }
}

String _$propertiesRepositoryHash() =>
    r'ad8ea4fd98a5acceb2667672510971dddc91bd6e';

@ProviderFor(properties)
final propertiesProvider = PropertiesProvider._();

final class PropertiesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Property>>,
          List<Property>,
          FutureOr<List<Property>>
        >
    with $FutureModifier<List<Property>>, $FutureProvider<List<Property>> {
  PropertiesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'propertiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$propertiesHash();

  @$internal
  @override
  $FutureProviderElement<List<Property>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Property>> create(Ref ref) {
    return properties(ref);
  }
}

String _$propertiesHash() => r'5ca8be2dee281c05adc8a5e7b4e32343270da176';

@ProviderFor(property)
final propertyProvider = PropertyFamily._();

final class PropertyProvider
    extends
        $FunctionalProvider<AsyncValue<Property>, Property, FutureOr<Property>>
    with $FutureModifier<Property>, $FutureProvider<Property> {
  PropertyProvider._({
    required PropertyFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'propertyProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$propertyHash();

  @override
  String toString() {
    return r'propertyProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Property> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Property> create(Ref ref) {
    final argument = this.argument as String;
    return property(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PropertyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$propertyHash() => r'4797f41a22dd5a6a01c2c438e0a15f67e5220a4b';

final class PropertyFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Property>, String> {
  PropertyFamily._()
    : super(
        retry: null,
        name: r'propertyProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PropertyProvider call(String id) =>
      PropertyProvider._(argument: id, from: this);

  @override
  String toString() => r'propertyProvider';
}

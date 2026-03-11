// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PropertiesList)
final propertiesListProvider = PropertiesListProvider._();

final class PropertiesListProvider
    extends $NotifierProvider<PropertiesList, List<Property>> {
  PropertiesListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'propertiesListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$propertiesListHash();

  @$internal
  @override
  PropertiesList create() => PropertiesList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Property> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Property>>(value),
    );
  }
}

String _$propertiesListHash() => r'2af2fa12a5faa532f9a8e94539be4df037623c72';

abstract class _$PropertiesList extends $Notifier<List<Property>> {
  List<Property> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Property>, List<Property>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Property>, List<Property>>,
              List<Property>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(PropertiesNotifier)
final propertiesProvider = PropertiesNotifierProvider._();

final class PropertiesNotifierProvider
    extends $AsyncNotifierProvider<PropertiesNotifier, Pagination> {
  PropertiesNotifierProvider._()
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
  String debugGetCreateSourceHash() => _$propertiesNotifierHash();

  @$internal
  @override
  PropertiesNotifier create() => PropertiesNotifier();
}

String _$propertiesNotifierHash() =>
    r'e1b5cf9eb985ad1b3703ca9f018284499181e9dd';

abstract class _$PropertiesNotifier extends $AsyncNotifier<Pagination> {
  FutureOr<Pagination> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Pagination>, Pagination>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Pagination>, Pagination>,
              AsyncValue<Pagination>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

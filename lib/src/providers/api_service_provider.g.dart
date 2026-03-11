// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ApiNotifier)
final apiProvider = ApiNotifierProvider._();

final class ApiNotifierProvider
    extends $NotifierProvider<ApiNotifier, ApiService> {
  ApiNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiNotifierHash();

  @$internal
  @override
  ApiNotifier create() => ApiNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiService>(value),
    );
  }
}

String _$apiNotifierHash() => r'57908e6029a31cb79c762abab154b4d3c9ebf548';

abstract class _$ApiNotifier extends $Notifier<ApiService> {
  ApiService build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ApiService, ApiService>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ApiService, ApiService>,
              ApiService,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

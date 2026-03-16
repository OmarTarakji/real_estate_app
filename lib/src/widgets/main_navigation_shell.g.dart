// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_navigation_shell.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedPageIndexNotifier)
final selectedPageIndexProvider = SelectedPageIndexNotifierProvider._();

final class SelectedPageIndexNotifierProvider
    extends $NotifierProvider<SelectedPageIndexNotifier, int> {
  SelectedPageIndexNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedPageIndexProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedPageIndexNotifierHash();

  @$internal
  @override
  SelectedPageIndexNotifier create() => SelectedPageIndexNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$selectedPageIndexNotifierHash() =>
    r'b29e608fc482a5c988985a107f8f7a1b7a97692e';

abstract class _$SelectedPageIndexNotifier extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

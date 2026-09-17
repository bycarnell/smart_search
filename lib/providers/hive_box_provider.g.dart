// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_box_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(hiveBox)
final hiveBoxProvider = HiveBoxProvider._();

final class HiveBoxProvider
    extends $FunctionalProvider<Box<Product>, Box<Product>, Box<Product>>
    with $Provider<Box<Product>> {
  HiveBoxProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hiveBoxProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hiveBoxHash();

  @$internal
  @override
  $ProviderElement<Box<Product>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Box<Product> create(Ref ref) {
    return hiveBox(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Box<Product> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Box<Product>>(value),
    );
  }
}

String _$hiveBoxHash() => r'd448f56a6fd4d29c6279dfe37dfb9947f77b3bbc';

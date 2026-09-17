// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debounced_search_query_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(debouncedSearchQuery)
final debouncedSearchQueryProvider = DebouncedSearchQueryProvider._();

final class DebouncedSearchQueryProvider
    extends $FunctionalProvider<AsyncValue<String>, String, Stream<String>>
    with $FutureModifier<String>, $StreamProvider<String> {
  DebouncedSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debouncedSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$debouncedSearchQueryHash();

  @$internal
  @override
  $StreamProviderElement<String> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<String> create(Ref ref) {
    return debouncedSearchQuery(ref);
  }
}

String _$debouncedSearchQueryHash() =>
    r'f877aa7ac2f55b2761e65a1014747fab50ad8759';

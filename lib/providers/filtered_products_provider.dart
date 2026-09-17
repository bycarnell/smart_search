import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_search/models/product.dart';
import 'package:smart_search/providers/product_list_provider.dart';
import 'package:smart_search/providers/debounced_search_query_provider.dart';

part 'filtered_products_provider.g.dart';

@riverpod
List<Product> filteredProducts(Ref ref) {
  final products = ref.watch(productListProvider);
  final queryAsync = ref.watch(debouncedSearchQueryProvider);

  final query = queryAsync.value ?? '';

  if (query.isEmpty) {
    return products;
  }

  final lowerQuery = query.toLowerCase();
  return products.where((product) {
    return product.name.toLowerCase().contains(lowerQuery) ||
        product.category.toLowerCase().contains(lowerQuery);
  }).toList();
}

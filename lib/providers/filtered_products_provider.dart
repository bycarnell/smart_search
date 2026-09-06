import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_search/models/product.dart';
import 'package:smart_search/providers/product_list_provider.dart';
import 'package:smart_search/providers/debounced_search_query_provider.dart';

final filteredProductsProvider = Provider<List<Product>>((ref) {
  final products = ref.watch(productListProvider);
  final queryAsync = ref.watch(debouncedSearchQueryProvider);

  // extrais le String de queryAsync (regarde les propriétés/méthodes
  // disponibles sur AsyncValue<String> pour récupérer la valeur, avec un
  // fallback à '' si ce n'est pas encore AsyncData)
  final query = queryAsync.value ?? '';
  
  // si la query (une fois en minuscule) est vide, retourne products tel quel
  if (query.isEmpty) {
    return products;
  }

  // sinon, filtre products : garde ceux dont le name OU la category
  // contient la query (comparaison insensible à la casse)
  final lowerQuery = query.toLowerCase();
  return products.where((product) {
    return product.name.toLowerCase().contains(lowerQuery) ||
        product.category.toLowerCase().contains(lowerQuery);
  }).toList();
});
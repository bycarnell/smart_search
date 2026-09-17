import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_search/models/product.dart';
import 'package:smart_search/providers/product_list_provider.dart';
import 'package:smart_search/providers/debounced_search_query_provider.dart';
import 'package:smart_search/providers/filtered_products_provider.dart';

class FakeProductList extends ProductList {
  final List<Product> fakeProducts;
  FakeProductList(this.fakeProducts);

  @override
  List<Product> build() => fakeProducts;
}

void main() {
  test('filtre les produits par nom ou catégorie', () {
    final testProducts = [
      Product(id: '1', name: 'Casque audio', category: 'Électronique'),
      Product(id: '2', name: 'Tapis de sol', category: 'Sport'),
      Product(id: '3', name: 'Souris sans fil', category: 'Électronique'),
    ];

    final container = ProviderContainer(
      overrides: [
        productListProvider.overrideWith(() => FakeProductList(testProducts)),
        debouncedSearchQueryProvider.overrideWithValue(const AsyncData("électronique")),
      ],
    );
    addTearDown(container.dispose);

    expect(container.read(filteredProductsProvider).length, 2);
  });
}

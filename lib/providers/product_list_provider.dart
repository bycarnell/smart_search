// lib/providers/product_list_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_search/models/product.dart';
import 'package:smart_search/providers/hive_box_provider.dart';

part 'product_list_provider.g.dart';

@riverpod
class ProductList extends _$ProductList {
  @override
  List<Product> build() {
    final box = ref.watch(hiveBoxProvider);

    if (box.isEmpty) {
      const categories = [
        'Électronique',
        'Maison',
        'Mode',
        'Sport',
        'Livres',
      ];

      for (var id = 1; id <= 50; id++) {
        final product = Product(
          id: id.toString(),
          name: 'Produit $id',
          category: categories[(id - 1) % categories.length],
        );
        box.put(product.id, product);
      }
    }

    return box.values.toList();
  }

  void addProduct(Product product) {
    ref.read(hiveBoxProvider).put(product.id, product);
    state = [...state, product];
  }

  void deleteProduct(String id) {
    ref.read(hiveBoxProvider).delete(id);
    state = state.where((p) => p.id != id).toList();
  }
}

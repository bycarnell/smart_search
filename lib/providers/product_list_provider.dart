import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:smart_search/models/product.dart';

class ProductListNotifier extends Notifier<List<Product>> {
  
  final box = Hive.box<Product>('products');

  @override

  List<Product> build() {

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
          // Sélectionne les catégories en boucle : 1er produit = 1re catégorie,
          // puis l'opérateur % recommence à la première après la dernière.
          category: categories[(id - 1) % categories.length],
        );
        box.put(product.id, product);
      }
    }

    return box.values.toList();
  }

  void addProduct (Product product) {
    box.put(product.id, product);
    state = [...state, product];
  }

  void deleteProduct (String id) {
    box.delete(id);
    state = state.where((p) => p.id != id).toList();
  }
}

final productListProvider = NotifierProvider<ProductListNotifier, List<Product>>((ProductListNotifier.new));
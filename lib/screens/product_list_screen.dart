import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_search/providers/filtered_products_provider.dart';
import 'package:smart_search/providers/product_list_provider.dart';
import 'package:smart_search/providers/search_query_provider.dart';

class ProductListScreen extends ConsumerWidget {

  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(filteredProductsProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des produits'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) => ref.read(searchQueryProvider.notifier).state = value,
          ),
          Text('${products.length} résultat(s)'),
          Expanded(
            child: ListView.builder (
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(product.category),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      ref.read(productListProvider.notifier).deleteProduct(product.id);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

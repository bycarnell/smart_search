import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:smart_search/models/product.dart';

final hiveBoxProvider = Provider<Box<Product>>((ref) {
  return Hive.box<Product>('products');
});

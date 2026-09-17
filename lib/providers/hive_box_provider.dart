import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_search/models/product.dart';

part 'hive_box_provider.g.dart';

@riverpod
Box<Product> hiveBox(Ref ref) {
  return Hive.box<Product>('products');
}

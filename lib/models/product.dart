import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  final String id; 
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.category,
  });

}
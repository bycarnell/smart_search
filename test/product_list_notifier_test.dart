import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_search/models/product.dart';
import 'package:smart_search/providers/hive_box_provider.dart';
import 'package:smart_search/providers/product_list_provider.dart';

class MockBox extends Mock implements Box<Product> {}

void main() {
  late MockBox mockBox;

  setUp(() {
    mockBox = MockBox();
  });

  test('deleteProduct retire le produit de state et appelle box.delete', () {
    final existingProduct = Product(
      id: '1',
      name: 'Casque audio',
      category: 'Électronique',
    );

    when(() => mockBox.isEmpty).thenReturn(false);
    when(() => mockBox.values).thenReturn([existingProduct]);
    when(() => mockBox.delete(any())).thenAnswer((_) async {});

    final container = ProviderContainer(
      overrides: [
        hiveBoxProvider.overrideWithValue(mockBox),
      ],
    );
    addTearDown(container.dispose);

    container.read(productListProvider.notifier).deleteProduct('1');

    verify(() => mockBox.delete('1')).called(1);
    expect(container.read(productListProvider), isEmpty);
  });
}

import 'package:adviqo_challenge/core/data_provider/hive_db/entity/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mockito/mockito.dart';

class MockHiveInterface extends Mock implements HiveInterface {}

class MockHiveBox extends Mock implements Box {}

main() {
  group("Test Add Product to Db logic", () {
    test("Checking Duplicate product", () {
      final currentProduct = Product(id: "1", title: "1");
      List<Product> products = [currentProduct];

      final existProductIndex =
          products.indexWhere((element) => element.id == currentProduct.id);
      if (existProductIndex > -1) products.removeAt(existProductIndex);

      products.add(currentProduct);

      expect(products.length, 1);
    });

    test("Test product can't be greater than 5", () {
      final currentProduct1 = Product(id: "1", title: "1");
      final currentProduct2 = Product(id: "2", title: "2");
      final currentProduct3 = Product(id: "3", title: "3");
      final currentProduct4 = Product(id: "4", title: "4");
      final currentProduct5 = Product(id: "5", title: "5");

      List<Product> products = [
        currentProduct1,
        currentProduct2,
        currentProduct3,
        currentProduct4,
        currentProduct5
      ];

      if (products.length > 4) {
        products.removeAt(0);
      }
      final currentProduct = Product(id: "6", title: "6");
      products.add(currentProduct);

      expect(products.length, 5);
    });
  });
}

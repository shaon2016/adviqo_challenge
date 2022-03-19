import 'package:adviqo_challenge/core/data_provider/hive_db/entity/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HiveDetailRepo {
  Future<int> addProduct(Product product);
}

class HiveDetailRepoImpl extends HiveDetailRepo {
  final HiveInterface? hiveInterface;

  HiveDetailRepoImpl({this.hiveInterface});

  @override
  Future<int> addProduct(Product product) async {
    try {
      Box<Product> box;
      if(hiveInterface == null) {
        box = await Product.openBox();
      } else {
        box = await hiveInterface!.openBox(productEntityName);
      }

      if (box.length > 4) {
        box.deleteAt(0);
      } else {
        // product exist
        final existProductIndex = box.values
            .toList()
            .indexWhere((element) => element.id == product.id);

        if (existProductIndex > -1) box.deleteAt(existProductIndex);
      }

      // Caching the product
      final value = await box.add(product);

      await box.close();
      return value;
    } catch (e) {
      rethrow;
    }
  }
}

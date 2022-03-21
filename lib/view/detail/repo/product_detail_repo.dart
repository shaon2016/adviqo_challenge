import 'package:adviqo_challenge/core/base/base_repo.dart';
import 'package:adviqo_challenge/core/data_provider/hive_db/entity/product.dart';
import 'package:adviqo_challenge/view/detail/model/product_detail_response.dart';
import 'package:flutter/foundation.dart';
import '../../../core/data_provider/app_url.dart';
import '../../../other/enums.dart';

class ProductDetailRepo extends BaseRepo {
  Future<ProductDetailsResponse?> fetch(String productId,
      [isToTest = false]) async {
    final map = <String, dynamic>{};

    try {
      final result = await apiClient.request(
        AppUrl.productDetailUrl + "/$productId",
        Method.get,
        map,
      );

      if (result != null && result.data != null) {
        final data = ProductDetailsResponse.fromJson(result.data);

        final currentProduct = Product(id: data.id, title: data.title);
        if (!isToTest) _addProduct(currentProduct);
        return data;
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    return null;
  }

  _addProduct(Product product) async {
    try {
      final box = await Product.openBox();

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
      await box.add(product);
      // closing the box
      await box.close();
    } catch (e) {
      rethrow;
    }
  }
}

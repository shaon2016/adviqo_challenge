import 'package:adviqo_challenge/core/base/base_repo.dart';
import 'package:adviqo_challenge/core/data_provider/hive_db/entity/product.dart';
import 'package:adviqo_challenge/view/detail/model/product_detail_response.dart';
import 'package:flutter/foundation.dart';
import '../../../core/data_provider/app_url.dart';
import '../../../other/enums.dart';

class ProductDetailRepo extends BaseRepo {
  Future<ProductDetailsResponse?> fetch(String productId) async {
    final map = <String, dynamic>{};

    try {
      final result = await apiClient.request(
        AppUrl.productDetailUrl + "/$productId",
        Method.get,
        map,
      );

      if (result != null && result.data != null) {
        final data = ProductDetailsResponse.fromJson(result.data);

        _storeLastVisitedProduct(data);
        return data;
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    return null;
  }

  _storeLastVisitedProduct(ProductDetailsResponse data) {
    final products = Product.openedBox();
    final currentProduct = Product(id: data.id, title: data.title);

    if (products.length > 4) {
      products.deleteAt(0);
    }

    products.add(currentProduct);
  }
}

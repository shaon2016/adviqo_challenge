import 'package:adviqo_challenge/core/base/base_repo.dart';
import 'package:adviqo_challenge/view/detail/model/product_detail_response.dart';
import 'package:flutter/foundation.dart';
import '../../../core/data_provider/app_url.dart';
import '../../../other/enums.dart';

class ProductDetailRepo extends BaseRepo {
  final String _productId;

  ProductDetailRepo(this._productId);

  Future<ProductDetailsResponse?> fetch() async {
    final map = <String, dynamic>{};

    try {
      final result = await apiClient.request(
        AppUrl.productDetailUrl + "/$_productId",
        Method.get,
        map,
      );

      if (result != null && result.data != null) {
        final data = ProductDetailsResponse.fromJson(result.data);

        return data;
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    return null;
  }
}

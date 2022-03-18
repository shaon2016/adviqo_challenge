import 'package:adviqo_challenge/core/base/base_repo.dart';
import 'package:adviqo_challenge/view/search/model/product_search_response.dart';
import 'package:flutter/foundation.dart';

import '../../../core/data_provider/app_url.dart';
import '../../../other/enums.dart';

class ProductSearchRepo extends BaseRepo {
  Future<List<ProductSearchResults>> searchItems(String searchQuery, int offset) async {
    final map = <String, dynamic>{};
    map['offset'] = offset;
    map['q'] = searchQuery;
    map['limit'] = 20;

    try {
      final result = await apiClient.request(
        AppUrl.searchUrl,
        Method.get,
        map,
      );

      if (result != null && result.data != null) {
        final data = ProductSearchResponse.fromJson(result.data);

        debugPrint(data.results.toString());

        return data.results;
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    return [];
  }
}

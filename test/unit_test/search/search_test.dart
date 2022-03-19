import 'dart:convert';

import 'package:adviqo_challenge/core/data_provider/app_url.dart';
import 'package:adviqo_challenge/view/search/model/product_search_response.dart';
import 'package:adviqo_challenge/view/search/repo/product_search_reoo.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import '../resource/fake_response.dart';

main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  Response<dynamic> fakeResponse;

  final repo = ProductSearchRepo();

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: AppUrl.baseUrl));
    dioAdapter = DioAdapter(dio: dio);
  });

  test("Should return search product list with length 2", () async {
    final map = <String, dynamic>{};
    map['offset'] = 1;
    map['q'] = "notebook";
    map['limit'] = 2;

    const url = AppUrl.productSearchUrl;
    // Our fake mock data
    dioAdapter.onGet(
      url,
      (server) => server.reply(200, jsonDecode(fakeSearchResponse)),
      queryParameters: map,
    );

    // Our actual data from server
    fakeResponse = await dio.get(url, queryParameters: map);
    final productSearchData = ProductSearchResponse.fromJson(fakeResponse.data);

    // Matching Server response with our fake mock response
    final searchData = await repo.searchItems("notebook", 1, limit: 2);
    expect(productSearchData.results.length, searchData.length);
  });
}

import 'dart:convert';
import 'package:adviqo_challenge/core/data_provider/app_url.dart';
import 'package:adviqo_challenge/view/detail/model/product_detail_response.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import '../resource/fake_response.dart';

main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  Response<dynamic> response;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: AppUrl.baseUrl));
    dioAdapter = DioAdapter(dio: dio);
  });

  test("Should return product detail", () async {
    const productId = "MLU479145688";
    const url = "${AppUrl.productDetailUrl}/$productId";
    // Our fake mock data
    dioAdapter.onGet(url, (server) => server.reply(200, jsonDecode(detailFakeResponse)));

    // Our actual data from server
    response = await dio.get(url);

    // Matching our server response code
    expect(response.statusCode, 200);

    // Matching Server response with our fake mock response
    final data = ProductDetailsResponse.fromJson(response.data);
    expect(data, isA<ProductDetailsResponse>());
  });
}

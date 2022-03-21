import 'dart:convert';
import 'package:adviqo_challenge/core/data_provider/app_url.dart';
import 'package:adviqo_challenge/view/detail/model/product_detail_response.dart';
import 'package:adviqo_challenge/view/detail/repo/product_detail_repo.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import '../resource/fake_response.dart';

main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  Response<dynamic> fakeResponse;

  final repo = ProductDetailRepo();

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: AppUrl.baseUrl));
    dioAdapter = DioAdapter(dio: dio);
  });

  test("Should return product detail", () async {
    const productId = "MLU479145688";
    const url = "${AppUrl.productDetailUrl}/$productId";
    // Our fake mock data
    dioAdapter.onGet(url, (server) => server.reply(200, jsonDecode(fakeDetailResponse)));

    // Our actual data from server
    fakeResponse = await dio.get(url);
    final fakeDetailData = ProductDetailsResponse.fromJson(fakeResponse.data);

    // Matching Server response with our fake mock response
    final productDetail = await repo.fetch(productId, true);
    expect(fakeDetailData.toString(), productDetail.toString());
  });

}



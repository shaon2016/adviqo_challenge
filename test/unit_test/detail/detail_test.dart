import 'package:adviqo_challenge/core/data_provider/app_url.dart';
import 'package:adviqo_challenge/view/detail/model/product_detail_response.dart';
import 'package:adviqo_challenge/view/detail/repo/product_detail_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../resource/fake_response.dart';

class DioMock extends Mock implements Dio {}

class Repo extends Mock implements ProductDetailRepo {}

main() {
  final dio = DioMock();
  dio.options.baseUrl = AppUrl.baseUrl;

  final repo = Repo();

  test("Should return product detail", () async {
    final response = Response(
        data: detailFakeResponse,
        requestOptions: RequestOptions(path: AppUrl.productDetailUrl));

    const url = "${AppUrl.productDetailUrl}/MLU479145688";
    when(dio.get(url)).thenAnswer((_) async => response);

    final result = await repo.fetch();
    expect(result, isA<ProductDetailsResponse>());
  });
}

import 'package:adviqo_challenge/core/data_provider/app_url.dart';
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
    final map = <String, dynamic>{};
    map['offset'] = 1;
    map['q'] = "";
    map['limit'] = 20;

    const url = AppUrl.productSearchUrl;
    // Our fake mock data
    dioAdapter.onGet(
      url,
      (server) => server.reply(200, fakeSearchResponse),
      queryParameters: map,
    );

    // Our actual data from server
    response = await dio.get(url, queryParameters: map);

    // Matching our server response code
    expect(response.statusCode, 200);

    // Matching Server response with our fake mock response
    expect(response.data.toString(), fakeSearchResponse);
  });
}

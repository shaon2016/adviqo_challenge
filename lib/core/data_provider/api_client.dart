import 'dart:convert';
import 'package:adviqo_challenge/util/view_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../other/enums.dart';
import 'app_url.dart';

class ApiClient {
  late Dio _dio;

  _initDio() {
    _dio = Dio(BaseOptions(baseUrl: AppUrl.baseUrl));
    _initInterceptors();
  }

  void _initInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      debugPrint(
          'REQUEST[${options.method}] => PATH: ${AppUrl.baseUrl}${options.path} '
          '=> Request Values: param: ${options.queryParameters}, DATA: ${options.data}, => HEADERS: ${options.headers}');
      return handler.next(options);
    }, onResponse: (response, handler) {
      debugPrint(
          'RESPONSE[${response.statusCode}] => DATA: ${response.data} URL: ${response.requestOptions.baseUrl}${response.requestOptions.path}');
      return handler.next(response);
    }, onError: (err, handler) {
      debugPrint(
          'ERROR[${err.response?.statusCode}] => DATA: ${err.response?.data} Message: ${err.message} URL: ${err.response?.requestOptions.baseUrl}${err.response?.requestOptions.path}');
      return handler.next(err);
    }));
  }

  Future request(
      String url, Method method, Map<String, dynamic>? params) async {
    late Response response;
    _initDio();

    try {
      // Handle response code from api
      if (method == Method.post) {
        response = await _dio.post(url, data: params);
      } else if (method == Method.get) {
        response = await _dio.get(
          url,
          queryParameters: params,
        );
      }

      if (response.statusCode == 200) {
        final Map data = json.decode(response.toString());

        final code = data['code'];
        if (code == 200) {
          return response;
        } else {
          if (code < 500) {
            List<String> messages = data['messages'].cast<String>();

            switch (code) {
              case 401:
                break;
              default:
                ViewUtil.showSnackBar(_extractMessages(messages));

                throw Exception(_extractMessages(messages));
            }
          } else {
            throw Exception();
          }
        }
      } else if (response.statusCode == 401) {
      } else if (response.statusCode == 500) {
      } else {}

      // Handle Error type if dio catches anything
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectTimeout:
          break;
        case DioErrorType.receiveTimeout:
          break;
        case DioErrorType.other:
          break;
        case DioErrorType.response:
          try {
            final response = e.response;
            if (response != null) {
              final Map data = json.decode(response.toString());

              final code = data['code'];

              if (code < 500) {
                List<String> messages = data['messages'].cast<String>();

                switch (code) {
                  case 401:
                    break;
                  default:
                    ViewUtil.showSnackBar(_extractMessages(messages));

                    throw Exception(_extractMessages(messages));
                }
              } else {
                throw Exception();
              }
            }
          } catch (e) {
            throw Exception(e);
          }
          break;

        default:
      }
    } catch (e) {}
  }

  _extractMessages(List<String> messages) {
    var str = "";

    for (var element in messages) {
      str += element;
    }

    return str;
  }
}

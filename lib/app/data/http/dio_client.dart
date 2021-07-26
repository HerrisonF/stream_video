import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

import 'package:teste_seventh/app/data/http/dio_interception_headers.dart';
import 'package:teste_seventh/app/data/http/dio_state.dart';
import 'package:teste_seventh/app/data/model/request_model.dart';

class DioClient {
  Dio instance;
  final log = Logger("DioClient");

  static const int _BAD_REQUEST = 400;

  DioClient() {
    BaseOptions options =
        BaseOptions(baseUrl: "URL BASE", responseType: ResponseType.json);
    instance = Dio(options);
    instance.interceptors.clear();
    instance.interceptors.add(HeadersInterceptor(dioClient: instance));
  }

  Future<RequestModel> post(String endpoint, String data,
      [Map<String, dynamic> queryParameters]) async {
    try {
      final stopwatch = Stopwatch()..start();
      final response = await instance.post(endpoint,
          data: data, queryParameters: queryParameters);
      log.info(' ENDPOINT $endpoint executed in ${stopwatch.elapsed}');
      stopwatch.stop();

      return RequestModel.fromJson(response.data, response.statusCode);
    } catch (e) {
      print("LOGIN BAD_REQUEST: ${e.toString()}");
      return RequestModel(statusCode: _BAD_REQUEST);
    }
  }
}

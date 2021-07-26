import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

import 'package:teste_seventh/app/data/http/dio_interception_headers.dart';
import 'package:teste_seventh/app/data/http/dio_state.dart';

class DioClient {
  Dio instance;
  final log = Logger("DioClient");

  static const int _OK_STATUS = 200;
  static const int _ERROR = 400;

  DioClient() {
    BaseOptions options =
    BaseOptions(baseUrl: "URL BASE", responseType: ResponseType.json);
    instance = Dio(options);
    instance.interceptors.clear();
    instance.interceptors.add(HeadersInterceptor(dioClient: instance));
  }

  Future<DioState> post(String endpoint, String data,
      [Map<String, dynamic> queryParameters]) async {
    try {
      final stopwatch = Stopwatch()..start();
      final response = await instance.post(endpoint,
          data: data, queryParameters: queryParameters);
      log.info(
          ' ENDPOINT $endpoint executed in ${stopwatch.elapsed}');
      stopwatch.stop();
      if (response.statusCode == _OK_STATUS) {
        return DioState(State.OK, response);
      }
      return DioState(State.ERROR, response);
    } catch (e) {
      return parseError(e);
    }
  }

  DioState parseError(dynamic e) {
    final errorNetwork = {
      "errorCode": "500",
      "message": "$e",
      "status": "500"
    };

    final errorNetworkResponse = json.encode(errorNetwork);
    log.severe(errorNetworkResponse);
    final response = Response(data: errorNetworkResponse, statusCode: 500);
    return DioState(State.ERROR, response);
  }

}
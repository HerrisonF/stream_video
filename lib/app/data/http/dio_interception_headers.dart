import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

class HeadersInterceptor extends Interceptor {
  final log = Logger("HeadersInterceptor");
  final errorAuth = 401;
  final Dio dioClient;

  HeadersInterceptor({this.dioClient});

  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    final customHeaders = {"x-api-key": "CHAVE BASE"};
    options.headers.addAll(customHeaders);

    log.info("uri:${options.uri}");
    log.info("baseURL:${options.baseUrl}");
    options.headers.forEach(printHeader);

    log.info("dataRequest: ${options.data}");
    return super.onRequest(options);
  }

  void printHeader(String key, dynamic value) {
    log.info("HEADER -> key=$key value=$value");
  }

  @override
  Future<FutureOr> onError(DioError dioError) async {
    dioError.response.request.headers.forEach(printHeader);
    log.info("statusCode:${dioError.response.statusCode}");
    log.info("statusMessage:${dioError.response.statusMessage}");
    log.info("message ${dioError.request.path} :${dioError.message}");

    return dioError;
  }

  @override
  Future onResponse(Response response) async {
    log.info("request Path ${response.request.path}");
    log.info("request ${response.request.data}");
    log.info("statusCode:${response.statusCode}");
    log.info("statusMessage:${response.statusMessage}");
    log.info(
        "dataResponse: ${response.statusCode} - ${response.request.path} - ${jsonEncode(response.data)}");
    return super.onResponse(response);
  }

}
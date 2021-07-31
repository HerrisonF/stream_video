import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:teste_seventh/app/controller/master_controller/master_controller.dart';
import 'package:teste_seventh/app/data/model/user.dart';

class HeadersInterceptor extends Interceptor {
  final log = Logger("HeadersInterceptor");
  final errorAuth = 401;
  final Dio dioClient;

  HeadersInterceptor({this.dioClient});

  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    MasterController masterController = GetIt.I<MasterController>();
    User user = await masterController.preferencesRepository.getUserPreferences();
    if(user.id.isNotEmpty){
      final tokenHeader = {"X-Access-Token":"${user.id}"};
      options.headers.addAll(tokenHeader);
    }
    log.info("uri:${options.uri}");
    log.info("baseURL:${options.baseUrl}");
    log.info("dataRequest: ${options.data}");
    log.info("HEADER: ${options.headers.toString()}");
    return super.onRequest(options);
  }

  @override
  Future<FutureOr> onError(DioError dioError) async {
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
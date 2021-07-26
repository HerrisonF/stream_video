import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_seventh/app/data/http/dio_client.dart';
import 'package:teste_seventh/app/data/http/dio_state.dart';
import 'package:teste_seventh/app/data/model/user.dart';

class HomeApiClient {
  final dioClientInstance = GetIt.I<DioClient>();

  Future<String> getVideoStream({@required String fileName}) async {
    String path = '/video/$fileName.mp4';
    try {
      final response = await dioClientInstance.get(path);
      if (response.state == CustomState.SUCCESS) {
        print(response.result.data['url']);
        return response.result.data['url'];
      }
      return "";
    } catch (e) {
      print("ERROR VIDEOSTREAM: $e");
      return "";
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stream_video/app/data/http/dio_client.dart';
import 'package:stream_video/app/data/http/dio_state.dart';
import 'package:stream_video/app/data/model/user.dart';

class HomeApiClient {
  final dioClientInstance = GetIt.I<DioClient>();

  Future<String> getVideoStream({@required String fileName}) async {
    String path = '/video/$fileName.mp4';
    try {
      // final response = await dioClientInstance.get(path);
      // if (response.state == CustomState.SUCCESS) {
      //   print(response.result.data['url']);
      //   return response.result.data['url'];
      // }
      return "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
    } catch (e) {
      print("ERROR VIDEOSTREAM: $e");
      return "";
    }
  }
}

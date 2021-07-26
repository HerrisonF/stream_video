import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:teste_seventh/app/data/http/dio_client.dart';
import 'package:teste_seventh/app/data/model/user.dart';

const baseUrl = "URLBASE";

class LoginApiClient {
  final dioClientInstance = GetIt.I<DioClient>();

  Future<User> login({String email, String password}) async {
    String path = 'path';
    try{
      final response = await dioClientInstance.post(
        path,
        json.encode({'grant_type': 'password'}),
        {'username': email, 'password': password},
      );
      print("TESTE ${response.result.data}");
    }catch(e){
      print("ERROR LOGIN: ${e.toString()}");
    }
  }
}

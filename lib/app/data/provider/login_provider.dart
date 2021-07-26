import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_seventh/app/data/http/dio_client.dart';
import 'package:teste_seventh/app/data/http/dio_state.dart';
import 'package:teste_seventh/app/data/model/request_model.dart';
import 'package:teste_seventh/app/data/model/user.dart';

const baseUrl = "https://mobiletest.seventh.com.br";

enum State { OK, BAD_REQUEST, UNAUTHORIZED}

class LoginApiClient {
  final dioClientInstance = GetIt.I<DioClient>();

  Future<User> login({@required String email, @required String password}) async {
    String path = '/login';
    try{
      RequestModel requestModel = await dioClientInstance.post(
        path,
        json.encode({'grant_type': 'password'}),
        {'username': email, 'password': password},
      );
      if(requestModel.statusCode == 200){
        print("LOGADO: ${requestModel.token}");
        //guarda o token
      }
    }catch(e){
      print("ERROR LOGIN: ${e.toString()}");
    }
  }
}

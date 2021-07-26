import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_seventh/app/data/http/dio_client.dart';
import 'package:teste_seventh/app/data/http/dio_state.dart';
import 'package:teste_seventh/app/data/model/user.dart';

class LoginApiClient {
  final dioClientInstance = GetIt.I<DioClient>();

  Future<User> login({@required String email, @required String password}) async {
    String path = '/login';
    try{
      User user = User();
      final response = await dioClientInstance.post(
        path,
        json.encode({'username': email, 'password': password}),
      );
      if(response.state == CustomState.SUCCESS){
        user.email = email;
        user.id = response.result.data['token'];
      }
      return user;
    }catch(e){
      print("ERROR LOGIN: $e");
      return User();
    }
  }
}

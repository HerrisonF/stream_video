import 'package:flutter/material.dart';

class RequestModel {
  String token;
  String message;
  int statusCode;

  RequestModel({this.token = "", this.message= "", @required this.statusCode});

  RequestModel.fromJson(Map<String, dynamic> json, int statusCode){
    token = json['token']??"";
    message = json['message']??"";
    this.statusCode = statusCode;
  }
}
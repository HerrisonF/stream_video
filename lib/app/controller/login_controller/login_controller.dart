import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_seventh/app/data/model/user.dart';
import 'package:teste_seventh/app/data/repository/login_repository.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final LoginRepository loginRepository = LoginRepository();

  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  @observable
  User user = User();

  void login() async {
    user = await loginRepository.login(
      emailEditingController.text,
      passwordEditingController.text,
    );
    //validar o user, validar os campos na tela, caso tudo certo, ir para Home
  }

}

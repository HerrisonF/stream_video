import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_seventh/app/controller/master_page_controller/master_page_controller.dart';
import 'package:teste_seventh/app/data/model/user.dart';
import 'package:teste_seventh/app/data/repository/login_repository.dart';
import 'package:teste_seventh/app/ui/android/pages/home_page/home_page.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {

  final LoginRepository loginRepository = LoginRepository();
  final MasterPageController masterPageController = GetIt.I<MasterPageController>();

  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  @observable
  User user = User();

  @observable
  bool showPassword = false;

  @observable
  bool isPasswordValid = true;

  @observable
  bool isEmailValid = true;

  @observable
  bool successLogin = true;

  @action
  setSuccessLogin(bool status){
    successLogin = status;
  }

  @action
  invalidPassWord() {
    isPasswordValid = !isPasswordValid;
  }

  @action
  invalidEmail() {
    isEmailValid = !isEmailValid;
  }

  @action
  changePasswordVisibility() {
    showPassword = !showPassword;
  }

  @action
  cleanFormError(){
    this.successLogin = true;
  }

  void login(BuildContext context) async {
    setSuccessLogin(true);
    user = await loginRepository.login(
      emailEditingController.value.text,
      passwordEditingController.value.text,
    );
    if (user.id.isNotEmpty) {
      masterPageController.setCurrentUser(user);
      masterPageController.persistUser();
      _pushToHome(context);
    }else{
      setSuccessLogin(false);
    }
    //validar o user, validar os campos na tela, caso tudo certo, ir para Home
  }

  _pushToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => HomePage(),
      ),
    );
  }
}

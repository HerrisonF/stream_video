import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_seventh/app/constants/assets.dart';
import 'package:teste_seventh/app/constants/text_constants.dart';
import 'package:teste_seventh/app/controller/login_controller/login_controller.dart';
import 'package:teste_seventh/app/ui/theme/app_theme.dart';

const MESSAGE_ERROR = "Esse campo é obrigatório";

final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> _emailFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();

class LoginPage extends StatelessWidget {
  final LoginController loginController = GetIt.I<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemeData.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                color: Colors.grey,
                child: SvgPicture.asset(logo),
              ),
              Form(
                key: _loginFormKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      height: 50,
                      width: double.infinity,
                      child: TextFormField(
                        controller: loginController.emailEditingController,
                        key: _emailFormKey,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return MESSAGE_ERROR;
                          }
                          return null;
                        },
                        onChanged: (value) {
                          loginController.cleanFormError();
                        },
                        onSaved: (value) {
                          print("TESTE");
                        },
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: emailHint,
                          labelStyle: TextStyle(
                            color: loginController.isPasswordValid
                                ? Colors.black
                                : Colors.red,
                            decorationColor: Colors.transparent,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      height: 50,
                      width: double.infinity,
                      child: Observer(
                        builder: (_) {
                          return TextFormField(
                            controller:
                                loginController.passwordEditingController,
                            key: _passwordFormKey,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return MESSAGE_ERROR;
                              }
                              return null;
                            },
                            onChanged: (value) {
                              loginController.cleanFormError();
                            },
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            obscureText: !loginController.showPassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  loginController.changePasswordVisibility();
                                },
                                icon: Observer(
                                  builder: (_) {
                                    return Icon(
                                      loginController.showPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: appThemeData.accentColor,
                                    );
                                  },
                                ),
                              ),
                              labelText: passwordHint,
                              labelStyle: TextStyle(
                                color: loginController.isPasswordValid
                                    ? Colors.black
                                    : Colors.red,
                                decorationColor: Colors.transparent,
                                decorationStyle: TextDecorationStyle.solid,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: OutlinedButton(
                  child: Text(
                    loginButton,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_loginFormKey.currentState.validate()) {
                      loginController.login(context);
                    } else {
                      loginController.setSuccessLogin(false);
                    }
                  },
                ),
              ),
              Observer(
                builder: (_) {
                  return !loginController.successLogin
                      ? Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            loginErrorMessage,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

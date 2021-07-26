// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  final _$userAtom = Atom(name: '_LoginController.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$showPasswordAtom = Atom(name: '_LoginController.showPassword');

  @override
  bool get showPassword {
    _$showPasswordAtom.reportRead();
    return super.showPassword;
  }

  @override
  set showPassword(bool value) {
    _$showPasswordAtom.reportWrite(value, super.showPassword, () {
      super.showPassword = value;
    });
  }

  final _$isPasswordValidAtom = Atom(name: '_LoginController.isPasswordValid');

  @override
  bool get isPasswordValid {
    _$isPasswordValidAtom.reportRead();
    return super.isPasswordValid;
  }

  @override
  set isPasswordValid(bool value) {
    _$isPasswordValidAtom.reportWrite(value, super.isPasswordValid, () {
      super.isPasswordValid = value;
    });
  }

  final _$isEmailValidAtom = Atom(name: '_LoginController.isEmailValid');

  @override
  bool get isEmailValid {
    _$isEmailValidAtom.reportRead();
    return super.isEmailValid;
  }

  @override
  set isEmailValid(bool value) {
    _$isEmailValidAtom.reportWrite(value, super.isEmailValid, () {
      super.isEmailValid = value;
    });
  }

  final _$successLoginAtom = Atom(name: '_LoginController.successLogin');

  @override
  bool get successLogin {
    _$successLoginAtom.reportRead();
    return super.successLogin;
  }

  @override
  set successLogin(bool value) {
    _$successLoginAtom.reportWrite(value, super.successLogin, () {
      super.successLogin = value;
    });
  }

  final _$_LoginControllerActionController =
      ActionController(name: '_LoginController');

  @override
  dynamic setSuccessLogin(bool status) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setSuccessLogin');
    try {
      return super.setSuccessLogin(status);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic invalidPassWord() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.invalidPassWord');
    try {
      return super.invalidPassWord();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic invalidEmail() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.invalidEmail');
    try {
      return super.invalidEmail();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePasswordVisibility() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.changePasswordVisibility');
    try {
      return super.changePasswordVisibility();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic cleanFormError() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.cleanFormError');
    try {
      return super.cleanFormError();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
showPassword: ${showPassword},
isPasswordValid: ${isPasswordValid},
isEmailValid: ${isEmailValid},
successLogin: ${successLogin}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MasterPageController on _MasterPageController, Store {
  final _$userAtom = Atom(name: '_MasterPageController.user');

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

  final _$_MasterPageControllerActionController =
      ActionController(name: '_MasterPageController');

  @override
  dynamic setCurrentUser(User user) {
    final _$actionInfo = _$_MasterPageControllerActionController.startAction(
        name: '_MasterPageController.setCurrentUser');
    try {
      return super.setCurrentUser(user);
    } finally {
      _$_MasterPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}

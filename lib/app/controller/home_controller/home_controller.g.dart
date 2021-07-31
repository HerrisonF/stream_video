// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$urlAtom = Atom(name: '_HomeController.url');

  @override
  String get url {
    _$urlAtom.reportRead();
    return super.url;
  }

  @override
  set url(String value) {
    _$urlAtom.reportWrite(value, super.url, () {
      super.url = value;
    });
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  dynamic setVideoStreamUrl(String url) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setVideoStreamUrl');
    try {
      return super.setVideoStreamUrl(url);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
url: ${url}
    ''';
  }
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_seventh/app/controller/master_page_controller/master_page_controller.dart';

class MasterPage extends StatelessWidget {

  final MasterPageController masterPageController = GetIt.I<MasterPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("LOGADO: ${masterPageController.user.email}"),
        ),
      ),
    );
  }
}

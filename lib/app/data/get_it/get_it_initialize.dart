import 'package:get_it/get_it.dart';
import 'package:teste_seventh/app/controller/login_controller/login_controller.dart';
import 'package:teste_seventh/app/controller/master_page_controller/master_page_controller.dart';

import '../http/dio_client.dart';

abstract class GetItInitialize {

  static getItControllers(){
    GetIt.I.registerSingleton(DioClient());
    GetIt.I.registerSingleton(MasterPageController());
    GetIt.I.registerSingleton(LoginController());
  }
}
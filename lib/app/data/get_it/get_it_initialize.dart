import 'package:get_it/get_it.dart';
import 'package:stream_video/app/controller/home_controller/home_controller.dart';
import 'package:stream_video/app/controller/login_controller/login_controller.dart';
import 'package:stream_video/app/controller/master_controller/master_controller.dart';

import '../http/dio_client.dart';

abstract class GetItInitialize {

  static getItControllers(){
    GetIt.I.registerSingleton(DioClient());
    GetIt.I.registerSingleton(MasterController());
    GetIt.I.registerSingleton(LoginController());
    GetIt.I.registerSingleton(HomeController());
  }
}
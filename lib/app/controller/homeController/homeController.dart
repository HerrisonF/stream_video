import 'package:mobx/mobx.dart';
import 'package:teste_seventh/app/data/repository/home_repository.dart';

part 'homeController.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {

  HomeRepository homeRepository = HomeRepository();

  getVideoStream(String fileName){
    homeRepository.getVideoStream(fileName);
  }

}
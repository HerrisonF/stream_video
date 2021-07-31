import 'package:mobx/mobx.dart';
import 'package:teste_seventh/app/data/repository/home_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {

  HomeRepository homeRepository = HomeRepository();

  @observable
  String url = "";

  getVideoStream(String fileName) async {
    setVideoStreamUrl(await homeRepository.getVideoStream(fileName));
  }

  @action
  setVideoStreamUrl(String url){
    this.url = url;
  }

}
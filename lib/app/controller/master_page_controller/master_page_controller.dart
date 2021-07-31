import 'package:mobx/mobx.dart';
import 'package:teste_seventh/app/data/model/user.dart';
import 'package:teste_seventh/app/data/repository/preferences_repository.dart';

part 'master_page_controller.g.dart';

class MasterPageController = _MasterPageController with _$MasterPageController;

abstract class _MasterPageController with Store {

  final PreferencesRepository preferencesRepository = PreferencesRepository();

  @observable
  User user = User();

  @action
  setCurrentUser(User user){
    this.user = user;
  }

  persistUser(){
    preferencesRepository.saveUserPreferences(user);
  }

  Future<bool> isUserLogged() async {
    user = await preferencesRepository.getUserPreferences();
    return user.id.isNotEmpty;
  }

  removeUser(){
    preferencesRepository.removeUser();
  }

}
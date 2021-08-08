import 'package:mobx/mobx.dart';
import 'package:stream_video/app/data/model/user.dart';
import 'package:stream_video/app/data/repository/preferences_repository.dart';

part 'master_controller.g.dart';

class MasterController = _MasterController with _$MasterController;

abstract class _MasterController with Store {

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
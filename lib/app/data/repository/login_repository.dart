import 'package:teste_seventh/app/data/model/user.dart';
import 'package:teste_seventh/app/data/provider/login_provider.dart';

class LoginRepository {

  final LoginApiClient loginApiClient = LoginApiClient();

  Future<User> login(String email, String password){
    return loginApiClient.login(email: email, password: password);
  }

}
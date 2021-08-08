import 'package:stream_video/app/data/model/user.dart';
import 'package:stream_video/app/data/provider/login_provider.dart';

class LoginRepository {

  final LoginApiClient loginApiClient = LoginApiClient();

  Future<User> login(String email, String password){
    return loginApiClient.login(email: email, password: password);
  }

}
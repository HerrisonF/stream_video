import 'package:teste_seventh/app/data/provider/home_provider.dart';

class HomeRepository {

  final HomeApiClient homeApiClient = HomeApiClient();

  Future<String> getVideoStream(String fileName) async {
    return homeApiClient.getVideoStream(fileName: fileName);
  }

}
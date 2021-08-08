import 'package:stream_video/app/data/provider/home_provider.dart';

class HomeRepository {

  final HomeApiClient homeApiClient = HomeApiClient();

  Future<String> getVideoStream(String fileName) async {
    return await homeApiClient.getVideoStream(fileName: fileName);
  }

}
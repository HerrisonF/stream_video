import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_seventh/app/controller/homeController/homeController.dart';
import 'package:teste_seventh/app/controller/master_page_controller/master_page_controller.dart';
import 'package:teste_seventh/app/ui/android/components/video_player.dart';
import 'package:teste_seventh/app/ui/android/pages/login_page/login_page.dart';

const String _FILENAME = 'bunny';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeController homeController = GetIt.I<HomeController>();
  final MasterPageController masterController = GetIt.I<MasterPageController>();

  @override
  void initState() {
    super.initState();
    getVideoUrl();
  }

  getVideoUrl() async {
    await homeController.getVideoStream(_FILENAME);
    if(homeController.url.isEmpty){
      masterController.removeUser();
      _pushToLogin();
    }
  }

  _pushToLogin(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Observer(
              builder: (_){
                return homeController.url.isNotEmpty ? VideoPlayer(url: homeController.url)
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                  ],
                );
              }
          ),
        ),
    );
  }
}

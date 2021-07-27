import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_seventh/app/controller/homeController/homeController.dart';
import 'package:teste_seventh/app/ui/android/components/video_player.dart';

const String _FILENAME = 'bunny';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeController homeController = GetIt.I<HomeController>();

  @override
  void initState() {
    super.initState();
    getVideoUrl();
  }

  getVideoUrl() {
    homeController.getVideoStream(_FILENAME);
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

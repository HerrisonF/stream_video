import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_seventh/app/controller/homeController/homeController.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = GetIt.I<HomeController>();
  VideoPlayerController controller;
  ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    controller = VideoPlayerController.network(
        await homeController.getVideoStream('bunny'))
      ..addListener(() {
        setState(() {
          //isso aqui faz o video se atualizar
        });
      })
      ..setLooping(true)
      ..initialize().then((value) {
        createChewieController();
        //controller.play();
      });
  }

  void createChewieController() {
    chewieController = ChewieController(
      videoPlayerController: controller,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: chewieController != null && chewieController.videoPlayerController.value.isInitialized
                  ? Container(
                      alignment: Alignment.topCenter,
                      child: Chewie(controller: chewieController,),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text('Loading'),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

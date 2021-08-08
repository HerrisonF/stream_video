import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:stream_video/app/data/get_it/get_it_initialize.dart';
import 'package:stream_video/app/ui/theme/app_theme.dart';

import 'app/ui/android/components/splash_screen.dart';

void main(){
  GetItInitialize.getItControllers();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Logger logger = Logger("Init Application");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Stream Video",
      theme: appThemeData,
      home: SplashScreen(),
    );
  }
}

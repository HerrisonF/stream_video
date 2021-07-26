import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:teste_seventh/app/ui/theme/app_theme.dart';

import 'app/ui/android/components/splash_screen.dart';

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
      title: "Seventh",
      theme: appThemeData,
      supportedLocales: [const Locale('pt', 'BR')],
      home: SplashScreen(),
    );
  }
}

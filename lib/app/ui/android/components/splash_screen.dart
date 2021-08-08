import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:stream_video/app/constants/assets.dart';
import 'package:stream_video/app/controller/master_controller/master_controller.dart';
import 'package:stream_video/app/ui/android/pages/home_page/home_page.dart';
import 'package:stream_video/app/ui/android/pages/login_page/login_page.dart';
import 'package:stream_video/app/ui/theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final MasterController masterController = GetIt.I<MasterController>();

  @override
  void initState() {
    super.initState();
    _isUserLogged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: appThemeData.backgroundColor,
        child: Center(
          child: Image(
            image: AssetImage(logo),
          ),
        ),
      ),
    );
  }

  _isUserLogged() async {
    // bool isUserLogged = await masterController.isUserLogged();
    // if(isUserLogged){
    _pushToHome();
    // }else{
    //   _pushToLogin();
    // }
  }

  _pushToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  _pushToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_seventh/app/constants/assets.dart';
import 'package:teste_seventh/app/controller/master_page_controller/master_page_controller.dart';
import 'package:teste_seventh/app/ui/android/pages/home_page/home_page.dart';
import 'package:teste_seventh/app/ui/android/pages/login_page/login_page.dart';
import 'package:teste_seventh/app/ui/theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final MasterPageController masterPageController = GetIt.I<MasterPageController>();

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
          child: SvgPicture.asset(logo, height: 40,width: 40,),
        ),
      ),
    );
  }

  _isUserLogged() async {
    bool isUserLogged = await masterPageController.isUserLogged();
    if(isUserLogged){
      _pushToHome();
    }else{
      _pushToLogin();
    }
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

import 'package:flutter/material.dart';
import 'package:teste_seventh/app/ui/android/pages/master_page/master_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _pushToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Container(
        child: Center(
          child: Text("SPLASHSCREN"),
        ),
      ),
    );
  }

  _pushToHome() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MasterPage()),
    );
  }
}

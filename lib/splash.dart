import 'package:flutter/material.dart';
import 'package:werofit/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('Assets/Appicon.png')),
          color: Colors.grey[100]),
    );
  }
}

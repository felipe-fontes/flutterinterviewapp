import 'package:flutter/material.dart';
import 'package:interviewapp/main.dart';
import 'package:interviewapp/shared/utils/colors.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new SplashScreen(
        seconds: 1,
        navigateAfterSeconds: new MyApp(),
        image: new Image.asset('assets/images/logo.png'),
        backgroundColor: AppColors.boticario100,
        photoSize: 100,
        useLoader: false,
      ),
    );
  }
}

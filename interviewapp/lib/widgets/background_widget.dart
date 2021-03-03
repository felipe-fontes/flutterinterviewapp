import 'package:flutter/material.dart';
import 'package:interviewapp/shared/utils/colors.dart';

class BackgroundWidget extends StatefulWidget {
  BackgroundWidget({Key key}) : super(key: key);

  @override
  _BackgroundWidgetState createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.companyColor,
                AppColors.background,
              ],
            ),
          ),
          child: Center(
            child: Text(
              'Hello Gradient!',
              style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

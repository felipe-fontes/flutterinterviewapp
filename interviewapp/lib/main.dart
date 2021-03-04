import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';
import 'package:interviewapp/pages/home/home_page.dart';
import 'package:interviewapp/pages/login/login_page.dart';
import 'package:interviewapp/setup.dart';
import 'package:interviewapp/shared/utils/colors.dart';

void main() {
  setup();
  runApp(new MaterialApp(
    home: new MyApp(),
    theme: ThemeData(
      primaryColor: AppColors.companyColor,
      accentColor: AppColors.companyColorSmoth,
      cursorColor: AppColors.companyColor,
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Widget> loadFromFuture() async {
    final _rep = GetIt.I<UserRepository>();
    var user = await _rep.logged();

    //await Future.delayed(Duration(seconds: 10));

    if (user == null)
      return new LoginPage();
    else
      return new HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder<Widget>(
        future: loadFromFuture(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data;
          }

          return Text('Loading');
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _controller;

  @override
  void initState() {
    _controller = GetIt.I<LoginController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('LoginPage'),
    );
  }
}

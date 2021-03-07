import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:interviewapp/pages/createAccount/create_account_page.dart';
import 'package:interviewapp/shared/utils/colors.dart';
import 'package:interviewapp/widgets/common_button.dart';
import 'package:interviewapp/widgets/common_text_field.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _loginController;

  @override
  void initState() {
    _loginController = GetIt.I<LoginController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Observer(
                builder: (_) => Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),
                    Image.asset(
                      "assets/images/logo.png",
                      height: 100,
                      color: AppColors.boticario100,
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    CommonTextField(
                      label: 'Email',
                      onChanged: _loginController.setEmail,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    CommonTextField(
                      label: 'Password',
                      obscureText: true,
                      onChanged: _loginController.setPassword,
                    ),
                    Text(_loginController.errorMessage),
                    Row(
                      children: [
                        CommonButton(
                          onPressed: () => _loginController.login(),
                          text: 'Login',
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CommonButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateAccountPage()),
                            );
                          },
                          text: 'Create account',
                        ),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
/*
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 50,
                child: Container(),
              ),
              Flexible(
                flex: 5,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        child: Text('Hello!!'),
                      ),
                    ),
                    Center(
                      child: Container(
                        child: Text('Welcome to my interview app'),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: _loginController.setEmail,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your password',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: _loginController.setPassword,
                    ),
                    Center(
                      child: Container(
                        child: ElevatedButton(
                          onPressed: () => _loginController.login(),
                          child: Text('Login'),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateAccountPage()),
                            );
                          },
                          child: Text('Create account'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  */
}

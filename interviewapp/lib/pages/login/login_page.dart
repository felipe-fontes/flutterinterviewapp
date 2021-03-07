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
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:interviewapp/shared/utils/colors.dart';
import 'package:interviewapp/widgets/common_button.dart';
import 'package:interviewapp/widgets/common_text_field.dart';

import 'create_account_controller.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({Key key}) : super(key: key);

  final _createAccountController = GetIt.I<CreateAccountController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Observer(
              builder: (_) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    "assets/images/logo.png",
                    height: 100,
                    color: AppColors.boticario100,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CommonTextField(
                    label: 'Email',
                    onChanged: _createAccountController.setEmail,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CommonTextField(
                    label: 'Password',
                    obscureText: true,
                    onChanged: _createAccountController.setPassword,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CommonTextField(
                    label: 'Username',
                    onChanged: _createAccountController.setName,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _createAccountController.errorMessage,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Theme.of(context).errorColor),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: CommonButton(
                        onPressed: () async {
                          final user = await _createAccountController.create();
                          if (user != null) {
                            Navigator.pop(context);
                          }
                        },
                        text: 'Create account',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'create_account_controller.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({Key key}) : super(key: key);

  final _createAccountController = GetIt.I<CreateAccountController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Observer(
              builder: (_) => Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    "assets/images/logo.png",
                    width: 180,
                    // height: 0,
                  ),
                  TextField(
                    onChanged: _createAccountController.setEmail,
                    decoration: InputDecoration(hintText: "Enter Email"),
                  ),
                  TextField(
                    onChanged: _createAccountController.setPassword,
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Enter password"),
                  ),
                  TextField(
                    onChanged: _createAccountController.setName,
                    decoration: InputDecoration(hintText: "Enter Username"),
                  ),
                  Text(_createAccountController.errorMessage),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: ElevatedButton(
                        onPressed: () async {
                          final user = await _createAccountController.create();
                          if (user != null) {
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Create account'),
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

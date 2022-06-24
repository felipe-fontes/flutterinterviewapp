import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/users/domain/entities/user.dart';
import 'package:interviewapp/modules/users/domain/errors/errors.dart';
import 'package:interviewapp/modules/users/domain/usecases/login.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final Login _login;

  _LoginControllerBase(
    this._login,
  );

  @observable
  String email;

  @observable
  String password;

  @observable
  bool logged;

  @observable
  bool error = false;

  @observable
  String errorMessage = '';

  @action
  void setEmail(String value) {
    email = value;
    error = false;
  }

  @action
  void setPassword(String value) {
    password = value;
    error = false;
  }

  @action
  Future<User> login() async {
    try {
      if (email == null || password == null) {
        error = true;
        return null;
      }

      final loginResult = await _login(email, password);

      if (loginResult.isRight()) {
        logged = true;
        return loginResult | null;
      } else {
        UserError loginError = loginResult.fold(id, null);
        errorMessage = loginError.message;
        error = true;
      }
    } catch (ex) {
      print(ex);
      error = true;
    }

    return null;
  }
}

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
  Future login() async {
    try {
      if (email == null || password == null) {
        error = true;
        return;
      }

      final loginResult = await _login(email, password);

      if (loginResult.isRight()) {
        logged = true;
      } else {
        error = true;
      }
    } catch (ex) {
      print(ex);
      error = true;
    }
  }
}

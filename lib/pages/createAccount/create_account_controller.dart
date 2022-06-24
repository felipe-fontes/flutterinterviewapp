import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/users/domain/entities/user.dart';
import 'package:interviewapp/modules/users/domain/errors/errors.dart';
import 'package:interviewapp/modules/users/domain/usecases/create_user.dart';
import 'package:mobx/mobx.dart';
part 'create_account_controller.g.dart';

class CreateAccountController = _CreateAccountControllerBase
    with _$CreateAccountController;

abstract class _CreateAccountControllerBase with Store {
  final CreateUser _createUser;

  _CreateAccountControllerBase(this._createUser);

  @observable
  String email;

  @observable
  String password;

  @observable
  String name;

  @observable
  bool created;

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
  void setName(String value) {
    name = value;
    error = false;
  }

  @action
  Future<User> create() async {
    try {
      final loginResult = await _createUser(email, password, name);

      if (loginResult.isRight()) {
        created = true;
      } else {
        UserError loginError = loginResult.fold(id, null);
        errorMessage = loginError.message;
        error = true;
      }

      return loginResult | null;
    } catch (ex) {
      print(ex);
      error = true;
    }

    return null;
  }
}

import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/users/domain/errors/errors.dart';
import 'package:interviewapp/shared/utils/strings.dart';

class BaseUser {
  bool _validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool _validatePassword(String password) {
    if (password.length >= 6) return true;
    return false;
  }

  Either<InvalidEmail, bool> validateEmail(String email) {
    if (email == null || email.isEmpty || !_validateEmail(email)) {
      return Left(InvalidEmail(AppString.emailRequired));
    }

    return Right(true);
  }

  Either<InvalidPassword, bool> validatePassword(String password) {
    if (password == null || password.isEmpty || !_validatePassword(password)) {
      return Left(InvalidPassword(AppString.invalidPassword));
    }

    return Right(true);
  }
}

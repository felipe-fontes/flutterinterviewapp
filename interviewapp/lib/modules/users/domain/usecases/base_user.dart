import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/users/domain/errors/errors.dart';

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
      return Left(InvalidEmail('A valid email is required'));
    }

    return Right(true);
  }

  Either<InvalidPassword, bool> validatePassword(String password) {
    if (password == null || password.isEmpty || !_validatePassword(password)) {
      return Left(InvalidPassword(
          'A valid password is required, it needs to be more than 6 characteres'));
    }

    return Right(true);
  }
}

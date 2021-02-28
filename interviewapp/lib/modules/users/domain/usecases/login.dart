import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';
import 'package:interviewapp/modules/users/domain/entities/user.dart';
import 'package:interviewapp/modules/users/domain/errors/errors.dart';
import 'package:interviewapp/modules/users/domain/usecases/user_util.dart';

abstract class Login {
  Future<Either<UserError, User>> call(String email, String password);
}

class LoginImpl implements Login {
  final UserRepository _userRepository;

  LoginImpl(this._userRepository);

  Future<Either<UserError, User>> call(String email, String password) async {
    try {
      if (email == null || email.isEmpty || !UserUtil.validateEmail(email)) {
        return Left(InvalidEmail('A valid email is required'));
      }

      if (password == null ||
          password.isEmpty ||
          !UserUtil.validatePassword(password)) {
        return Left(InvalidPassword(
            'A valid password is required, it needs to be more than 6 characteres'));
      }

      final response = await _userRepository.login(email, password);

      if (response == null) {
        return Left(InvalidLogin('Invalid email or password!'));
      }

      return Right(response);
    } catch (ex) {
      print(ex);
      return Left(UnableToLogin('Ops and error ocurred, try again later!'));
    }
  }
}

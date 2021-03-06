import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';
import 'package:interviewapp/modules/users/domain/entities/user.dart';
import 'package:interviewapp/modules/users/domain/errors/errors.dart';
import 'package:interviewapp/modules/users/domain/usecases/base_user.dart';
import 'package:interviewapp/shared/utils/strings.dart';

abstract class Login {
  Future<Either<UserError, User>> call(String email, String password);
}

class LoginImpl extends BaseUser implements Login {
  final UserRepository _userRepository;

  LoginImpl(this._userRepository);

  Future<Either<UserError, User>> call(String email, String password) async {
    try {
      final emailValidation = validateEmail(email);
      if (emailValidation.isLeft()) {
        final error = emailValidation.fold<InvalidEmail>(id, null);
        return Left(error);
      }

      final passwordValidation = validatePassword(password);
      if (passwordValidation.isLeft()) {
        final error = passwordValidation.fold<InvalidPassword>(id, null);
        return Left(error);
      }
      final response = await _userRepository.login(email, password);

      if (response == null) {
        return Left(InvalidLogin(AppString.invalidLogin));
      }

      return Right(response);
    } catch (ex) {
      print(ex);
      return Left(UnableToLogin(AppString.genericCriticalError));
    }
  }
}

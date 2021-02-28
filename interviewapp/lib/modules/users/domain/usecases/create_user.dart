import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';
import 'package:interviewapp/modules/users/domain/entities/user.dart';
import 'package:interviewapp/modules/users/domain/errors/errors.dart';
import 'package:interviewapp/modules/users/domain/usecases/user_util.dart';

abstract class CreateUser {
  Future<Either<UserError, User>> call(
      String email, String password, String name);
}

class CreateUserImpl implements CreateUser {
  final UserRepository _userRepository;

  CreateUserImpl(this._userRepository);

  Future<Either<UserError, User>> call(
      String email, String password, String name) async {
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

      final response = await _userRepository.create(email, password, name);

      if (response == null) {
        return Left(UnableToCreate('Something went wrong, try again later!'));
      }

      return Right(response);
    } catch (ex) {
      print(ex);
      return Left(UnableToCreate('Ops and error ocurred, try again later!'));
    }
  }
}

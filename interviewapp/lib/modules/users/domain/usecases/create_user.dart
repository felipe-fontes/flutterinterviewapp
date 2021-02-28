import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';
import 'package:interviewapp/modules/users/domain/entities/user.dart';
import 'package:interviewapp/modules/users/domain/errors/errors.dart';
import 'package:interviewapp/modules/users/domain/usecases/base_user.dart';

abstract class CreateUser {
  Future<Either<UserError, User>> call(
      String email, String password, String name);
}

class CreateUserImpl extends BaseUser implements CreateUser {
  final UserRepository _userRepository;

  CreateUserImpl(this._userRepository);

  Future<Either<UserError, User>> call(
      String email, String password, String name) async {
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

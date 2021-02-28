import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';
import 'package:interviewapp/modules/users/domain/entities/user.dart';
import 'package:interviewapp/modules/users/domain/errors/errors.dart';

abstract class GetLoggedUser {
  Future<Either<UserError, User>> call();
}

class GetLoggedUserImpl implements GetLoggedUser {
  final UserRepository _userRepository;

  GetLoggedUserImpl(this._userRepository);

  Future<Either<UserError, User>> call() async {
    try {
      final response = await _userRepository.logged();

      if (response == null) {
        return Left(UserNotLogged('User not logged!'));
      }

      return Right(response);
    } catch (ex) {
      print(ex);
      return Left(
          UnableToGetLoggedUser('Ops and error ocurred, try again later!'));
    }
  }
}

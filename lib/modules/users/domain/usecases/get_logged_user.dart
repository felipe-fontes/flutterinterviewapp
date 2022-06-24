import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';
import 'package:interviewapp/modules/users/domain/entities/user.dart';
import 'package:interviewapp/modules/users/domain/errors/errors.dart';
import 'package:interviewapp/shared/utils/strings.dart';

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
        return Left(UserNotLogged(AppString.userNotLogged));
      }

      return Right(response);
    } catch (ex) {
      print(ex);
      return Left(UnableToGetLoggedUser(AppString.genericCriticalError));
    }
  }
}

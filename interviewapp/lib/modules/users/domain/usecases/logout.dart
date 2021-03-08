import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';
import 'package:interviewapp/modules/users/domain/errors/errors.dart';
import 'package:interviewapp/modules/users/domain/usecases/base_user.dart';
import 'package:interviewapp/shared/utils/strings.dart';

abstract class Logout {
  Future<Either<UserError, bool>> call();
}

class LogoutImpl extends BaseUser implements Logout {
  final UserRepository _userRepository;

  LogoutImpl(this._userRepository);

  Future<Either<UserError, bool>> call() async {
    try {
      final response = await _userRepository.logout();

      return Right(response);
    } catch (ex) {
      print(ex);
      return Left(UnableToLogout(AppString.genericCriticalError));
    }
  }
}

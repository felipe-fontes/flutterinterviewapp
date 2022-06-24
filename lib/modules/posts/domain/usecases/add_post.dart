import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/posts/domain/contracts/post_repository.dart';
import 'package:interviewapp/modules/posts/domain/entities/post.dart';
import 'package:interviewapp/modules/posts/domain/errors/errors.dart';
import 'package:interviewapp/modules/posts/domain/usecases/base_post.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';
import 'package:interviewapp/shared/utils/strings.dart';

abstract class AddPost {
  Future<Either<PostError, Post>> call(String message);
}

class AddPostImpl extends BasePost implements AddPost {
  final PostRepository _postRepository;
  final UserRepository _userRepository;

  AddPostImpl(this._postRepository, this._userRepository);

  Future<Either<PostError, Post>> call(String message) async {
    try {
      final messageValidation = validateMessage(message);
      if (messageValidation.isLeft()) {
        final error = messageValidation.fold<InvalidMessage>(id, null);
        return Left(error);
      }

      final user = await _userRepository.logged();
      if (user == null) {
        return Left(UnableToAdd(AppString.addPostUserNotFound));
      }

      final response = await _postRepository.add(message);

      if (response == null) {
        return Left(UnableToAdd(AppString.genericError));
      }

      return Right(response);
    } catch (ex) {
      print(ex);
      return Left(UnableToAdd(AppString.genericCriticalError));
    }
  }
}

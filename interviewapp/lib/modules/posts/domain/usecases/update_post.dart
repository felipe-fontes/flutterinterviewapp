import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/posts/domain/contracts/post_repository.dart';
import 'package:interviewapp/modules/posts/domain/entities/post.dart';
import 'package:interviewapp/modules/posts/domain/errors/errors.dart';
import 'package:interviewapp/modules/posts/domain/usecases/base_post.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';

abstract class UpdatePost {
  Future<Either<PostError, Post>> call(Post post, String message);
}

class UpdatePostImpl extends BasePost implements UpdatePost {
  final PostRepository _postRepository;
  final UserRepository _userRepository;

  UpdatePostImpl(this._postRepository, this._userRepository);

  Future<Either<PostError, Post>> call(Post post, String message) async {
    try {
      if (post == null || post.id == null) {
        return Left(InvalidPost('A valid post is required'));
      }

      final messageValidation = validateMessage(message);
      if (messageValidation.isLeft()) {
        final error = messageValidation.fold<InvalidMessage>(id, null);
        return Left(error);
      }

      final user = await _userRepository.logged();
      if (user == null) {
        return Left(
            UnableToUpdate('You need to be logged in order to update a post!'));
      }

      if (user.id != post.user.id) {
        return Left(UnableToUpdate('You can`t update somebody else post!'));
      }

      final response = await _postRepository.update(post.id, message);

      if (response == null) {
        return Left(UnableToUpdate('Something went wrong, try again later!'));
      }

      return Right(response);
    } catch (ex) {
      print(ex);
      return Left(UnableToUpdate('Ops and error ocurred, try again later!'));
    }
  }
}

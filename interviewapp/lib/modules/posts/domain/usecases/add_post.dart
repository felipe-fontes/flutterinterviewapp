import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/posts/domain/contracts/post_repository.dart';
import 'package:interviewapp/modules/posts/domain/entities/post.dart';
import 'package:interviewapp/modules/posts/domain/errors/errors.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';

abstract class AddPost {
  Future<Either<PostError, Post>> call(String message);
}

class AddPostImpl implements AddPost {
  final PostRepository _postRepository;
  final UserRepository _userRepository;

  int _messageLength = 280;

  AddPostImpl(this._postRepository, this._userRepository);

  Future<Either<PostError, Post>> call(String message) async {
    try {
      if (message == null || message.isEmpty) {
        return Left(InvalidMessage('A message is required'));
      }

      if (message.length > _messageLength) {
        return Left(InvalidMessage(
            'Your message is too long, try to stay below $_messageLength'));
      }

      final user = await _userRepository.logged();
      if (user == null) {
        return Left(UnableToAdd('You need to be logged in order to add post!'));
      }

      final response = await _postRepository.add(message, user, DateTime.now());

      if (response == null) {
        return Left(UnableToAdd('Something went wrong, try again later!'));
      }

      return Right(response);
    } catch (ex) {
      print(ex);
      return Left(UnableToAdd('Ops and error ocurred, try again later!'));
    }
  }
}

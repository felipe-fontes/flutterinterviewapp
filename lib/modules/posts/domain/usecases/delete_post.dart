import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/posts/domain/contracts/post_repository.dart';
import 'package:interviewapp/modules/posts/domain/entities/post.dart';
import 'package:interviewapp/modules/posts/domain/errors/errors.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';
import 'package:interviewapp/shared/utils/strings.dart';

abstract class DeletePost {
  Future<Either<PostError, bool>> call(Post post);
}

class DeletePostImpl implements DeletePost {
  final PostRepository _postRepository;
  final UserRepository _userRepository;

  DeletePostImpl(this._postRepository, this._userRepository);

  Future<Either<PostError, bool>> call(Post post) async {
    try {
      if (post == null || post.id == null) {
        return Left(InvalidPost('A valid post is required'));
      }

      final user = await _userRepository.logged();
      if (user == null) {
        return Left(UnableToDelete(AppString.deletePostUserNotFound));
      }

      if (user.id != post.user.id) {
        return Left(UnableToDelete(AppString.deleteOtherPeoplePostError));
      }

      final response = await _postRepository.delete(post.id);

      if (response == null || !response) {
        return Left(UnableToDelete(AppString.genericError));
      }

      return Right(response);
    } catch (ex) {
      print(ex);
      return Left(UnableToDelete(AppString.genericCriticalError));
    }
  }
}

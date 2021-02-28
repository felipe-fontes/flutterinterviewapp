import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/posts/domain/contracts/post_repository.dart';
import 'package:interviewapp/modules/posts/domain/entities/post.dart';
import 'package:interviewapp/modules/posts/domain/errors/errors.dart';

abstract class GetPosts {
  Future<Either<PostError, List<Post>>> call();
}

class GetPostsImpl implements GetPosts {
  final PostRepository _postRepository;

  GetPostsImpl(this._postRepository);

  Future<Either<PostError, List<Post>>> call() async {
    try {
      final response = await _postRepository.getAll();

      if (response == null) {
        return Left(UnableToGet('Something went wrong, try again later!'));
      }

      return Right(response);
    } catch (ex) {
      print(ex);
      return Left(UnableToGet('Ops and error ocurred, try again later!'));
    }
  }
}

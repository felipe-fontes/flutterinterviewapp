import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interviewapp/modules/posts/domain/contracts/post_repository.dart';
import 'package:interviewapp/modules/posts/domain/entities/post.dart';
import 'package:interviewapp/modules/posts/domain/errors/errors.dart';
import 'package:interviewapp/modules/posts/domain/usecases/add_post.dart';
import 'package:interviewapp/modules/posts/domain/usecases/get_posts.dart';
import 'package:mockito/mockito.dart';

class PostRepositoryMock extends Mock implements PostRepository {}

main() {
  final repository = PostRepositoryMock();
  final usecase = GetPostsImpl(repository);

  test('Should return List<Post>', () async {
    when(repository.getAll()).thenAnswer((_) async => <Post>[]);

    final result = await usecase();

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<Post>>());
  });

  test('Should return UnableToGet when repository return null', () async {
    when(repository.getAll()).thenAnswer((_) async => null);

    final result = await usecase();

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<UnableToGet>());
  });

  test('Should return UnableToGet when repository throws any Exception',
      () async {
    when(repository.getAll()).thenThrow(() => Exception());

    final result = await usecase();

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<UnableToGet>());
  });
}

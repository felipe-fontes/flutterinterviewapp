import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interviewapp/modules/posts/domain/contracts/post_repository.dart';
import 'package:interviewapp/modules/posts/domain/entities/post.dart';
import 'package:interviewapp/modules/posts/domain/errors/errors.dart';
import 'package:interviewapp/modules/posts/domain/usecases/delete_post.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';
import 'package:interviewapp/modules/users/domain/entities/user.dart';
import 'package:mockito/mockito.dart';

class PostRepositoryMock extends Mock implements PostRepository {}

class UserRepositoryMock extends Mock implements UserRepository {}

main() {
  final repository = PostRepositoryMock();
  final userRepository = UserRepositoryMock();
  final usecase = DeletePostImpl(repository, userRepository);

  test('Should delete Post', () async {
    when(repository.delete(any)).thenAnswer((_) async => true);
    when(userRepository.logged()).thenAnswer((_) async => User(id: 'testId'));
    final post = Post(id: 'testePostId', user: User(id: 'testId'));

    final result = await usecase(post);

    expect(result.isRight(), true);
  });

  test('Should return InvalidPost when post is null', () async {
    final result = await usecase(null);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidPost>());
  });

  test('Should return InvalidPost when post id is null', () async {
    final post = Post(user: User(id: 'testId'));

    final result = await usecase(post);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidPost>());
  });

  test('Should return UnableToDelete when logged user is null', () async {
    when(userRepository.logged()).thenAnswer((_) async => null);

    final post = Post(id: 'testPostId', user: User(id: 'testId'));

    final result = await usecase(post);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<UnableToDelete>());
  });

  test('Should return UnableToDelete when postRepository delete return null',
      () async {
    when(repository.delete(any)).thenAnswer((_) async => null);
    when(userRepository.logged()).thenAnswer((_) async => User(id: 'testId'));

    final post = Post(id: 'testPostId', user: User(id: 'testId'));

    final result = await usecase(post);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<UnableToDelete>());
  });

  test('Should return UnableToDelete when postRepository delete return false',
      () async {
    when(repository.delete(any)).thenAnswer((_) async => false);
    when(userRepository.logged()).thenAnswer((_) async => User(id: 'testId'));

    final post = Post(id: 'testPostId', user: User(id: 'testId'));

    final result = await usecase(post);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<UnableToDelete>());
  });

  test('Should return UnableToDelete when userRepository throws any Exception',
      () async {
    when(repository.delete(any)).thenAnswer((_) async => true);
    when(userRepository.logged()).thenThrow((_) async => Exception());
    final post = Post(id: 'testPostId', user: User(id: 'testId'));

    final result = await usecase(post);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<UnableToDelete>());
  });

  test('Should return UnableToDelete when postRepository throws any Exception',
      () async {
    when(repository.delete(any)).thenThrow((_) async => Exception());
    when(userRepository.logged()).thenAnswer((_) async => User(id: 'testId'));
    final post = Post(id: 'testPostId', user: User(id: 'testId'));

    final result = await usecase(post);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<UnableToDelete>());
  });
}

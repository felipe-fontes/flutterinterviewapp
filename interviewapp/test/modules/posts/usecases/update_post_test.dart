import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interviewapp/modules/posts/domain/contracts/post_repository.dart';
import 'package:interviewapp/modules/posts/domain/entities/post.dart';
import 'package:interviewapp/modules/posts/domain/errors/errors.dart';
import 'package:interviewapp/modules/posts/domain/usecases/update_post.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';
import 'package:interviewapp/modules/users/domain/entities/user.dart';
import 'package:mockito/mockito.dart';

class PostRepositoryMock extends Mock implements PostRepository {}

class UserRepositoryMock extends Mock implements UserRepository {}

main() {
  final repository = PostRepositoryMock();
  final userRepository = UserRepositoryMock();
  final usecase = UpdatePostImpl(repository, userRepository);

  test('Should update Post', () async {
    when(repository.update(any, any, any)).thenAnswer((_) async => Post());
    when(userRepository.logged()).thenAnswer((_) async => User(id: 'testId'));
    final post = Post(id: 'testePostId', user: User(id: 'testId'));

    final result = await usecase(post, 'update message');

    expect(result.isRight(), true);
  });

  test('Should return InvalidPost when post is null', () async {
    final result = await usecase(null, 'update message');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidPost>());
  });

  test('Should return InvalidPost when post id is null', () async {
    final post = Post(user: User(id: 'testId'));

    final result = await usecase(post, 'update message');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidPost>());
  });

  test('Should return UnableToUpdate when logged user is null', () async {
    when(userRepository.logged()).thenAnswer((_) async => null);

    final post = Post(id: 'testPostId', user: User(id: 'testId'));

    final result = await usecase(post, 'update message');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<UnableToUpdate>());
  });

  test('Should return UnableToUpdate when postRepository update return null',
      () async {
    when(repository.update(any, any, any)).thenAnswer((_) async => null);
    when(userRepository.logged()).thenAnswer((_) async => User(id: 'testId'));

    final post = Post(id: 'testPostId', user: User(id: 'testId'));

    final result = await usecase(post, 'update message');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<UnableToUpdate>());
  });

  test('Should return UnableToUpdate when userRepository throws any Exception',
      () async {
    when(repository.update(any, any, any)).thenAnswer((_) async => Post());
    when(userRepository.logged()).thenThrow((_) async => Exception());
    final post = Post(id: 'testPostId', user: User(id: 'testId'));

    final result = await usecase(post, 'update message');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<UnableToUpdate>());
  });

  test('Should return UnableToUpdate when postRepository throws any Exception',
      () async {
    when(repository.update(any, any, any)).thenThrow((_) async => Exception());
    when(userRepository.logged()).thenAnswer((_) async => User(id: 'testId'));
    final post = Post(id: 'testPostId', user: User(id: 'testId'));

    final result = await usecase(post, 'update message');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<UnableToUpdate>());
  });

  test('Should return InvalidMessage when message is null', () async {
    final post = Post(id: 'testPostId', user: User(id: 'testId'));

    final result = await usecase(post, null);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidMessage>());
  });

  test('Should return InvalidMessage when message is empty', () async {
    final post = Post(id: 'testPostId', user: User(id: 'testId'));

    final result = await usecase(post, '');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidMessage>());
  });

  test('Should return InvalidMessage when message lenght above 280 characteres',
      () async {
    final message =
        'UEiojC6w949I5dw6CMyjBVVE8HOcrbwwVKJkcLaFXOMyu64MObGJylggTLAFWzUKU9cUdvVPaCgDUTKxunhYENk2aMJzcxE0obcqMCtoW8UV1XUmAdgFu4B7NIayaeGjrgvqQHabjqf0iLptzj5a6FfsfJLrsvrWMyuhPDPAxeXpA9ClHhpoaAjQUMsQTKLl2U7gB1sOzianodqnWfQSOqhTyMdRCeiSD6mryABI38SIux7YkceBcuFIwyOScVUcQ4Yd4iBqcqCWFZGKz9MHjCZd1';
    final post = Post(id: 'testPostId', user: User(id: 'testId'));

    final result = await usecase(post, message);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidMessage>());
  });

  test('Should return Post when message lenght is 280 characteres', () async {
    when(repository.update(any, any, any)).thenAnswer((_) async => Post());
    when(userRepository.logged()).thenAnswer((_) async => User(id: 'testId'));
    final post = Post(id: 'testPostId', user: User(id: 'testId'));
    final message =
        'UEiojC6w949I5dw6CMyjBVVE8HOcrbwwVKJkcLaFXOMyu64MObGJylggTLAFWzUKU9cUdvVPaCgDUTKxunhYENk2aMJzcxE0obcqMCtoW8UV1XUmAdgFu4B7NIayaeGjrgvqQHabjqf0iLptzj5a6FfsfJLrsvrWMyuhPDPAxeXpA9ClHhpoaAjQUMsQTKLl2U7gB1sOzianodqnWfQSOqhTyMdRCeiSD6mryABI38SIux7YkceBcuFIwyOScVUcQ4Yd4iBqcqCWFZGKz9MHjCZd';

    final result = await usecase(post, message);

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<Post>());
  });
}

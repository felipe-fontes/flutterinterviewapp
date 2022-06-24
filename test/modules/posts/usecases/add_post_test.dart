import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interviewapp/modules/posts/domain/contracts/post_repository.dart';
import 'package:interviewapp/modules/posts/domain/entities/post.dart';
import 'package:interviewapp/modules/posts/domain/errors/errors.dart';
import 'package:interviewapp/modules/posts/domain/usecases/add_post.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';
import 'package:interviewapp/modules/users/domain/entities/user.dart';
import 'package:mockito/mockito.dart';

class PostRepositoryMock extends Mock implements PostRepository {}

class UserRepositoryMock extends Mock implements UserRepository {}

main() {
  final repository = PostRepositoryMock();
  final userRepository = UserRepositoryMock();
  final usecase = AddPostImpl(repository, userRepository);

  test('Should return Post', () async {
    when(repository.add(any)).thenAnswer((_) async => Post());
    when(userRepository.logged()).thenAnswer((_) async => User());

    final result = await usecase('test');

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<Post>());
  });

  test('Should return UnableToAdd when repository return null', () async {
    when(repository.add(any)).thenAnswer((_) async => null);
    when(userRepository.logged()).thenAnswer((_) async => User());

    final result = await usecase('test');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<UnableToAdd>());
  });

  test('Should return InvalidMessage when message is null', () async {
    final result = await usecase(null);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidMessage>());
  });

  test('Should return InvalidMessage when message is empty', () async {
    final result = await usecase('');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidMessage>());
  });

  test('Should return InvalidMessage when message lenght above 280 characteres',
      () async {
    final message =
        'UEiojC6w949I5dw6CMyjBVVE8HOcrbwwVKJkcLaFXOMyu64MObGJylggTLAFWzUKU9cUdvVPaCgDUTKxunhYENk2aMJzcxE0obcqMCtoW8UV1XUmAdgFu4B7NIayaeGjrgvqQHabjqf0iLptzj5a6FfsfJLrsvrWMyuhPDPAxeXpA9ClHhpoaAjQUMsQTKLl2U7gB1sOzianodqnWfQSOqhTyMdRCeiSD6mryABI38SIux7YkceBcuFIwyOScVUcQ4Yd4iBqcqCWFZGKz9MHjCZd1';
    final result = await usecase(message);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidMessage>());
  });

  test('Should return Post when message lenght is 280 characteres', () async {
    when(repository.add(any)).thenAnswer((_) async => Post());
    when(userRepository.logged()).thenAnswer((_) async => User());
    final message =
        'UEiojC6w949I5dw6CMyjBVVE8HOcrbwwVKJkcLaFXOMyu64MObGJylggTLAFWzUKU9cUdvVPaCgDUTKxunhYENk2aMJzcxE0obcqMCtoW8UV1XUmAdgFu4B7NIayaeGjrgvqQHabjqf0iLptzj5a6FfsfJLrsvrWMyuhPDPAxeXpA9ClHhpoaAjQUMsQTKLl2U7gB1sOzianodqnWfQSOqhTyMdRCeiSD6mryABI38SIux7YkceBcuFIwyOScVUcQ4Yd4iBqcqCWFZGKz9MHjCZd';

    final result = await usecase(message);

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<Post>());
  });

  test('Should return UnableToAdd when repository throws any Exception',
      () async {
    when(repository.add(any)).thenThrow(() => Exception());
    when(userRepository.logged()).thenAnswer((_) async => User());

    final result = await usecase('test');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<PostError>());
  });

  test('Should return UnableToAdd when userRepository throws any Exception',
      () async {
    when(repository.add(any)).thenAnswer((_) async => Post());
    when(userRepository.logged()).thenThrow((_) async => Exception());

    final result = await usecase('test');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<PostError>());
  });

  test('Should return UnableToAdd when userRepository return null', () async {
    when(repository.add(any)).thenAnswer((_) async => Post());
    when(userRepository.logged()).thenAnswer((_) async => null);

    final result = await usecase('test');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<PostError>());
  });
}

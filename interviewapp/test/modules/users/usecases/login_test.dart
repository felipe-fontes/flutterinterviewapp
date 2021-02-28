import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';
import 'package:interviewapp/modules/users/domain/entities/user.dart';
import 'package:interviewapp/modules/users/domain/errors/errors.dart';
import 'package:interviewapp/modules/users/domain/usecases/login.dart';
import 'package:mockito/mockito.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

main() {
  final repository = UserRepositoryMock();
  final usecase = LoginImpl(repository);

  test('Should return User', () async {
    when(repository.login(any, any)).thenAnswer((_) async => User());

    final result = await usecase('felipe-fontes@hotmail.com', '123456');

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<User>());
  });

  test('Should return InvalidEmail when email is null', () async {
    when(repository.login(any, any)).thenAnswer((_) async => null);

    final result = await usecase(null, '123456');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidEmail>());
  });

  test('Should return InvalidEmail when email is empty', () async {
    when(repository.login(any, any)).thenAnswer((_) async => null);

    final result = await usecase('', '123456');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidEmail>());
  });

  test('Should return InvalidEmail when email is invalid', () async {
    when(repository.login(any, any)).thenAnswer((_) async => null);

    final result = await usecase('felipefontes', '123456');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidEmail>());
  });

  test('Should return InvalidPassword when password is null', () async {
    when(repository.login(any, any)).thenAnswer((_) async => null);

    final result = await usecase('felipe-fontes@hotmail.com', null);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidPassword>());
  });

  test('Should return InvalidPassword when password is empty', () async {
    when(repository.login(any, any)).thenAnswer((_) async => null);

    final result = await usecase('felipe-fontes@hotmail.com', '');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidPassword>());
  });

  test('Should return InvalidPassword when password is less than 6', () async {
    when(repository.login(any, any)).thenAnswer((_) async => null);

    final result = await usecase('felipe-fontes@hotmail.com', '12345');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidPassword>());
  });

  test('Should return InvalidLogin when repository return null', () async {
    when(repository.login(any, any)).thenAnswer((_) async => null);

    final result = await usecase('felipe-fontes@hotmail.com', '123456');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidLogin>());
  });

  test('Should return UnableToLogin when repository throws any Exception',
      () async {
    when(repository.login(any, any)).thenThrow(() => Exception());

    final result = await usecase('felipe-fontes@hotmail.com', '123456');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<UnableToLogin>());
  });
}

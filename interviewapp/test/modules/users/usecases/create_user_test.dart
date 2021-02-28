import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';
import 'package:interviewapp/modules/users/domain/entities/user.dart';
import 'package:interviewapp/modules/users/domain/errors/errors.dart';
import 'package:interviewapp/modules/users/domain/usecases/create_user.dart';
import 'package:mockito/mockito.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

main() {
  final repository = UserRepositoryMock();
  final usecase = CreateUserImpl(repository);

  test('Should return User', () async {
    when(repository.create(any, any, any)).thenAnswer((_) async => User());

    final result =
        await usecase('felipe-fontes@hotmail.com', '123456', 'Felipe');

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<User>());
  });

  test('Should return InvalidEmail when email is null', () async {
    when(repository.create(any, any, any)).thenAnswer((_) async => null);

    final result = await usecase(null, '123456', 'Felipe');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidEmail>());
  });

  test('Should return InvalidEmail when email is empty', () async {
    when(repository.create(any, any, any)).thenAnswer((_) async => null);

    final result = await usecase('', '123456', 'Felipe');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidEmail>());
  });

  test('Should return InvalidEmail when email is invalid', () async {
    when(repository.create(any, any, any)).thenAnswer((_) async => null);

    final result = await usecase('felipefontes', '123456', 'Felipe');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidEmail>());
  });

  test('Should return InvalidPassword when password is null', () async {
    when(repository.create(any, any, any)).thenAnswer((_) async => null);

    final result = await usecase('felipe-fontes@hotmail.com', null, 'Felipe');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidPassword>());
  });

  test('Should return InvalidPassword when password is empty', () async {
    when(repository.create(any, any, any)).thenAnswer((_) async => null);

    final result = await usecase('felipe-fontes@hotmail.com', '', 'Felipe');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidPassword>());
  });

  test('Should return InvalidPassword when password is less than 6', () async {
    when(repository.create(any, any, any)).thenAnswer((_) async => null);

    final result =
        await usecase('felipe-fontes@hotmail.com', '12345', 'Felipe');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidPassword>());
  });

  test('Should return UnableToCreate when repository return null', () async {
    when(repository.create(any, any, any)).thenAnswer((_) async => null);

    final result =
        await usecase('felipe-fontes@hotmail.com', '123456', 'Felipe');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<UnableToCreate>());
  });

  test('Should return UnableToCreate when repository throws any Exception',
      () async {
    when(repository.create(any, any, any)).thenThrow(() => Exception());

    final result =
        await usecase('felipe-fontes@hotmail.com', '123456', 'Felipe');

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<UnableToCreate>());
  });
}

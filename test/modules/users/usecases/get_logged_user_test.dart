import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';
import 'package:interviewapp/modules/users/domain/entities/user.dart';
import 'package:interviewapp/modules/users/domain/errors/errors.dart';
import 'package:interviewapp/modules/users/domain/usecases/get_logged_user.dart';
import 'package:mockito/mockito.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

main() {
  final repository = UserRepositoryMock();
  final usecase = GetLoggedUserImpl(repository);

  test('Should return User when repository return a logged user', () async {
    when(repository.logged()).thenAnswer((_) async => User());

    final result = await usecase();

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<User>());
  });

  test('Should return UserNotLogged when repository return null', () async {
    when(repository.logged()).thenAnswer((_) async => null);

    final result = await usecase();

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<UserNotLogged>());
  });

  test(
      'Should return UnableToGetLoggedUser when repository throws any Exception',
      () async {
    when(repository.logged()).thenThrow(() => Exception());

    final result = await usecase();

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<UnableToGetLoggedUser>());
  });
}

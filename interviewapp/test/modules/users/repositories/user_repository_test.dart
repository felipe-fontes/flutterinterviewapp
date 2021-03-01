import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interviewapp/modules/users/infra/contracts/user_datasource.dart';
import 'package:interviewapp/modules/users/infra/models/user_model.dart';
import 'package:interviewapp/modules/users/infra/repositories/user_repository_impl.dart';
import 'package:mockito/mockito.dart';

class UserDataSourceMock extends Mock implements UserDataSource {}

class StorageMock extends Mock implements FlutterSecureStorage {}

main() {
  final dataSource = UserDataSourceMock();
  final storage = StorageMock();
  final repository = UserRespositoryImpl(storage, dataSource);

  test('Create Should return UserModel', () async {
    when(dataSource.create(any, any, any)).thenAnswer((_) async => UserModel());

    final result = await repository.create('teste', 'testeId', 'felipe');

    expect(result, isA<UserModel>());
  });

  test('Logged Should return UserModel', () async {
    when(storage.containsKey(key: anyNamed('key')))
        .thenAnswer((_) async => true);
    final encodedData = UserModel().toJson();
    when(storage.read(key: anyNamed('key')))
        .thenAnswer((_) async => encodedData);

    final result = await repository.logged();

    expect(result, isA<UserModel>());
  });

  test('Logged Should return null when key does not exist', () async {
    when(storage.containsKey(key: anyNamed('key')))
        .thenAnswer((_) async => false);

    final result = await repository.logged();

    expect(result, null);
  });

  test('Login Should return UserModel', () async {
    when(dataSource.login(any, any)).thenAnswer((_) async => UserModel());

    final result =
        await repository.login('felipe-fontes@hotmail.com', '123456');

    expect(result, isA<UserModel>());
  });

  test('Login Should save UserModel in local storage', () async {
    when(dataSource.login(any, any)).thenAnswer((_) async => UserModel());

    final result =
        await repository.login('felipe-fontes@hotmail.com', '123456');

    verify(storage.write(key: anyNamed('key'), value: UserModel().toJson()))
        .called(1);
  });
}

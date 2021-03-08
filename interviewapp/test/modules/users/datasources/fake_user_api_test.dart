import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interviewapp/modules/users/datasources/users_ds_fake_api_impl.dart';
import 'package:interviewapp/modules/users/infra/models/user_model.dart';
import 'package:mockito/mockito.dart';

class StorageMock extends Mock implements FlutterSecureStorage {}

main() {
  final storage = StorageMock();
  final dataSource = UserDataSourceFakeApiImpl(storage);

  // test('Init Should Save Empty Array', () async {
  //   when(storage.containsKey(key: anyNamed('key')))
  //       .thenAnswer((_) async => true);
  //   when(storage.write(key: 'users', value: '[]')).thenAnswer((_) async {});

  //   await dataSource.init();

  //   verify(storage.write(key: 'users', value: '[]')).called(1);
  // });

  // test('Create Should return UserModel', () async {
  //   when(storage.create(any, any, any)).thenAnswer((_) async => UserModel());

  //   final result = await dataSource.create('teste', 'testeId', 'felipe');

  //   expect(result, isA<UserModel>());
  // });
}

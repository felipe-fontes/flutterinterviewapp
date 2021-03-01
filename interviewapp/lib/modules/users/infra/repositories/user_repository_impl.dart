import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:interviewapp/modules/users/domain/contracts/user_repository.dart';
import 'package:interviewapp/modules/users/domain/entities/user.dart';
import 'package:interviewapp/modules/users/infra/contracts/user_datasource.dart';
import 'package:interviewapp/modules/users/infra/models/user_model.dart';

class UserRespositoryImpl implements UserRepository {
  final FlutterSecureStorage _storage;
  final UserDataSource _userDataSource;
  final String _key = 'loggedUser';

  UserRespositoryImpl(this._storage, this._userDataSource);

  @override
  Future<User> create(String email, String password, String name) async {
    return await _userDataSource.create(email, password, name);
  }

  @override
  Future<User> logged() async {
    if (await _storage.containsKey(key: _key)) {
      return UserModel.fromJson(await _storage.read(key: _key));
    }
    return null;
  }

  @override
  Future<User> login(String email, String password) async {
    final user = await _userDataSource.login(email, password);
    if (user == null) return null;

    await _storage.write(key: _key, value: user.toJson());

    return user;
  }
}

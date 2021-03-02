import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:interviewapp/modules/users/infra/contracts/user_datasource.dart';
import 'package:interviewapp/modules/users/infra/models/user_model.dart';

class UserDataSourceFakeApiImpl implements UserDataSource {
  final FlutterSecureStorage _storage;
  final String _key = 'users';

  UserDataSourceFakeApiImpl(this._storage);

  @override
  Future<UserModel> create(String email, String password, String name) async {
    final db = await getDb();
    final foundUser =
        db.firstWhere((x) => x.email.toLowerCase() == email.toLowerCase());
    if (foundUser == null) {
      db.add(UserModel(
          email: email,
          id: UniqueKey().toString(),
          name: name,
          password: hash(password)));
    }
    return null;
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final db = await getDb();
    final foundUser = db.firstWhere(
        (x) =>
            x.email.toLowerCase() == email.toLowerCase() &&
            hash(password) == x.password,
        orElse: null);

    return foundUser;
  }

  void init() async {
    if (!await _storage.containsKey(key: _key)) {
      await _storage.write(key: _key, value: jsonEncode(<UserModel>[]));
    }
  }

  String hash(String data) {
    return md5.convert(utf8.encode(data)).toString();
  }

  Future<List<UserModel>> getDb() async {
    return jsonDecode(await _storage.read(key: _key));
  }
}

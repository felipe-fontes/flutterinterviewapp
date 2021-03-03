import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:interviewapp/modules/users/infra/contracts/user_datasource.dart';
import 'package:interviewapp/modules/users/infra/models/user_model.dart';

class UserDataSourceFakeApiImpl implements UserDataSource {
  final FlutterSecureStorage _storage;
  final String _key = 'users';

  UserDataSourceFakeApiImpl(this._storage) {
    this.init();
  }

  @override
  Future<UserModel> create(String email, String password, String name) async {
    final db = await getDb();
    db.clear();
    saveDb(db);
    final foundUser = db.firstWhere(
      (x) => x.email.toLowerCase() == email.toLowerCase(),
      orElse: () => null,
    );
    if (foundUser == null) {
      final user = UserModel(
        email: email,
        id: UniqueKey().toString(),
        name: name,
        password: hash(password),
      );
      db.add(user);
      await saveDb(db);
      return user;
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
      orElse: () => null,
    );

    return foundUser;
  }

  Future saveDb(List<UserModel> list) async {
    final json = jsonEncode(list);
    await _storage.write(key: _key, value: json);
  }

  Future init() async {
    if (!await _storage.containsKey(key: _key)) {
      await saveDb(<UserModel>[]);
    }
  }

  String hash(String data) {
    return md5.convert(utf8.encode(data)).toString();
  }

  Future<List<UserModel>> getDb() async {
    final json = await _storage.read(key: _key);
    final map = jsonDecode(json);
    List<UserModel> users =
        List<UserModel>.from(map.map((model) => UserModel.fromJson(model)));
    return users;
  }
}

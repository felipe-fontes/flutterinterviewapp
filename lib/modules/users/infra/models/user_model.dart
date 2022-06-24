import 'dart:convert';

import 'package:interviewapp/modules/users/domain/entities/user.dart';

class UserModel extends User {
  final String id;
  final String name;
  final String email;
  final String pictureUrl;
  final String password;

  UserModel({this.id, this.name, this.email, this.pictureUrl, this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'pictureUrl': pictureUrl,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      pictureUrl: map['pictureUrl'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}

import 'dart:convert';

import 'package:interviewapp/modules/users/domain/entities/user.dart';

class UserModel extends User {
  String id;
  String name;
  String email;
  String pictureUrl;

  UserModel({this.id, this.name, this.email, this.pictureUrl});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'pictureUrl': pictureUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      pictureUrl: map['pictureUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}

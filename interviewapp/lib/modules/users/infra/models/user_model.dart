import 'package:interviewapp/modules/users/domain/entities/user.dart';

class UserModel extends User {
  final String id;
  final String name;
  final String email;
  final String pictureUrl;

  UserModel({this.id, this.name, this.email, this.pictureUrl});
}

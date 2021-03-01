import 'package:interviewapp/modules/users/infra/models/user_model.dart';

abstract class UserDataSource {
  Future<UserModel> logged();
  Future<UserModel> login(String email, String password);
  Future<UserModel> create(String email, String password, String name);
}

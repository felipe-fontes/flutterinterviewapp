import 'package:interviewapp/modules/users/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> get();
  Future<User> login(String email, String password);
  Future<User> create(String email, String password, String name);
}

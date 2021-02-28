import 'package:interviewapp/modules/posts/domain/entities/post.dart';
import 'package:interviewapp/modules/users/domain/entities/user.dart';

abstract class PostRepository {
  Future<List<Post>> getAll();
  Future<Post> add(String message, User user, DateTime date);
  Future<Post> update(String message, User user, DateTime date);
  Future<bool> delete(Post post);
}

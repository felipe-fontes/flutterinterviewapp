import 'package:interviewapp/modules/posts/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getAll();
  Future<Post> add(String message, String userId, DateTime date);
  Future<Post> update(String postId, String message, DateTime date);
  Future<bool> delete(String postId);
}

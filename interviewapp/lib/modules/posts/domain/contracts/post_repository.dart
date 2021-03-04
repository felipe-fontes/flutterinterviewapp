import 'package:interviewapp/modules/posts/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getAll();
  Future<Post> add(String message);
  Future<Post> update(String postId, String message);
  Future<bool> delete(String postId);
}

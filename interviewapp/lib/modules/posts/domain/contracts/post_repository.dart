import 'package:interviewapp/modules/posts/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getAll();
  Future<Post> add(any);
}

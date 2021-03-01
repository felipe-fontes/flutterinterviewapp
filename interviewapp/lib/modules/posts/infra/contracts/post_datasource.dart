import 'package:interviewapp/modules/posts/infra/models/post_model.dart';

abstract class PostDataSource {
  Future<List<PostModel>> getAll();
  Future<PostModel> add(String message, String userId, DateTime date);
  Future<PostModel> update(String postId, String message, DateTime date);
  Future<bool> delete(String postId);
}

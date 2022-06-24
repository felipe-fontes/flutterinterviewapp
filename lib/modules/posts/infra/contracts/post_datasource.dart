import 'package:interviewapp/modules/posts/infra/models/post_model.dart';

abstract class PostDataSource {
  Future<List<PostModel>> getAll();
  Future<PostModel> add(String message);
  Future<PostModel> update(String postId, String message);
  Future<bool> delete(String postId);
}

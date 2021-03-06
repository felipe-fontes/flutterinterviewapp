import 'package:interviewapp/modules/posts/domain/contracts/post_repository.dart';
import 'package:interviewapp/modules/posts/domain/entities/post.dart';
import 'package:interviewapp/modules/posts/infra/contracts/post_datasource.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource _postDataSouce;

  PostRepositoryImpl(this._postDataSouce);

  @override
  Future<Post> add(String message) async {
    return await _postDataSouce.add(message);
  }

  @override
  Future<bool> delete(String postId) async {
    return await _postDataSouce.delete(postId);
  }

  @override
  Future<List<Post>> getAll() async {
    return await _postDataSouce.getAll();
  }

  @override
  Future<Post> update(String postId, String message) async {
    return await _postDataSouce.update(postId, message);
  }
}

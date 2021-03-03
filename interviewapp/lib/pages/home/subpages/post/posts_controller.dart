import 'package:interviewapp/modules/posts/domain/entities/post.dart';
import 'package:mobx/mobx.dart';

import 'package:interviewapp/modules/posts/domain/usecases/get_posts.dart';

part 'posts_controller.g.dart';

class PostsController = _PostsControllerBase with _$PostsController;

abstract class _PostsControllerBase with Store {
  final GetPosts _getPosts;
  _PostsControllerBase(
    this._getPosts,
  );

  @observable
  ObservableList<Post> posts = ObservableList<Post>();

  @action
  Future getPosts() async {
    final response = await _getPosts();
    if (response.isRight()) {
      posts.clear();
      final list = response | null;
      posts.addAll(list);
    }
    print(response);
  }
}

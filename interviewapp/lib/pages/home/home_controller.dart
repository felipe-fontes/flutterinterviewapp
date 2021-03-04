import 'package:dartz/dartz.dart';
import 'package:interviewapp/pages/home/subpages/post/posts_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:interviewapp/modules/posts/domain/usecases/add_post.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final AddPost _addPost;
  final PostsController _postsController;
  _HomeControllerBase(
    this._addPost,
    this._postsController,
  );

  @observable
  String errorMessage = '';
  @observable
  String message;

  @action
  setMessage(String newMessage) {
    errorMessage = '';
    message = newMessage;
  }

  @action
  String validateMessage(String message) {
    if (message != null && message.isNotEmpty)
      return 'Post messa can not be empty';
    return null;
  }

  @action
  Future<bool> sendPost() async {
    errorMessage = '';

    final result = await _addPost(message);

    if (result.isLeft()) {
      final error = result.fold(id, null);
      errorMessage = error.message;
      return false;
    }

    _postsController.getPosts();

    message = '';

    return true;
  }
}

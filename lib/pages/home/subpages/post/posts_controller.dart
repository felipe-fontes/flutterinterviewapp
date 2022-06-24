import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/posts/domain/entities/post.dart';
import 'package:interviewapp/modules/posts/domain/usecases/add_post.dart';
import 'package:interviewapp/modules/posts/domain/usecases/delete_post.dart';
import 'package:interviewapp/modules/posts/domain/usecases/update_post.dart';
import 'package:interviewapp/modules/users/domain/entities/user.dart';
import 'package:interviewapp/modules/users/domain/usecases/get_logged_user.dart';
import 'package:interviewapp/modules/users/domain/usecases/logout.dart';
import 'package:interviewapp/modules/users/infra/models/user_model.dart';
import 'package:mobx/mobx.dart';

import 'package:interviewapp/modules/posts/domain/usecases/get_posts.dart';

part 'posts_controller.g.dart';

class PostsController = _PostsControllerBase with _$PostsController;

abstract class _PostsControllerBase with Store {
  final AddPost _addPost;
  final GetPosts _getPosts;
  final GetLoggedUser _getLoggedUser;
  final DeletePost _deletePost;
  final UpdatePost _updatePost;
  final Logout _logout;

  _PostsControllerBase(
    this._addPost,
    this._getPosts,
    this._getLoggedUser,
    this._deletePost,
    this._updatePost,
    this._logout,
  );

  @observable
  ObservableList<PostDto> posts = ObservableList<PostDto>();

  @action
  Future getPosts() async {
    final response = await _getPosts();
    final userResponse = await _getLoggedUser();
    this.user = userResponse | null;
    if (response.isRight() && user != null) {
      posts.clear();
      final list = response | null;

      posts.addAll(list.map((post) => PostDto(post, user.id)));
    }
  }

  @observable
  User user;

  //# ADD

  @observable
  String errorMessage = '';

  @action
  Future<bool> sendPost(String message) async {
    errorMessage = '';

    final result = await _addPost(message);

    if (result.isLeft()) {
      final error = result.fold(id, null);
      errorMessage = error.message;
      return false;
    }

    this.getPosts();

    message = '';

    return true;
  }

  //# delete

  @action
  Future<bool> deletePost(PostDto post) async {
    final result = await _deletePost(post);

    if (result.isLeft()) {
      final error = result.fold(id, null);
      print(error);
      return false;
    }

    this.posts.remove(post);

    return true;
  }

  @action
  Future<bool> updatePost(PostDto post, String message) async {
    errorMessage = '';

    final result = await _updatePost(post, message);

    if (result.isLeft()) {
      final error = result.fold(id, null);
      errorMessage = error.message;
      return false;
    }

    this.getPosts();

    return true;
  }

  @action
  Future<bool> logout() async {
    final result = await _logout();

    if (result.isLeft()) {
      return false;
    }

    return true;
  }
}

class PostDto extends Post {
  String id;
  String message;
  String pictureUrl;
  DateTime date;
  UserModel user;
  bool userPost;

  PostDto(Post post, String userId) {
    this.date = post.date;
    this.id = post.id;
    this.message = post.message;
    this.pictureUrl = post.pictureUrl;
    this.user = post.user;
    this.userPost = post.user.id == userId;
  }
}

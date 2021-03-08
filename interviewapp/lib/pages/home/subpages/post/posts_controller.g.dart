// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostsController on _PostsControllerBase, Store {
  final _$postsAtom = Atom(name: '_PostsControllerBase.posts');

  @override
  ObservableList<PostDto> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(ObservableList<PostDto> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  final _$userAtom = Atom(name: '_PostsControllerBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_PostsControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$getPostsAsyncAction = AsyncAction('_PostsControllerBase.getPosts');

  @override
  Future<dynamic> getPosts() {
    return _$getPostsAsyncAction.run(() => super.getPosts());
  }

  final _$sendPostAsyncAction = AsyncAction('_PostsControllerBase.sendPost');

  @override
  Future<bool> sendPost(String message) {
    return _$sendPostAsyncAction.run(() => super.sendPost(message));
  }

  final _$deletePostAsyncAction =
      AsyncAction('_PostsControllerBase.deletePost');

  @override
  Future<bool> deletePost(PostDto post) {
    return _$deletePostAsyncAction.run(() => super.deletePost(post));
  }

  final _$updatePostAsyncAction =
      AsyncAction('_PostsControllerBase.updatePost');

  @override
  Future<bool> updatePost(PostDto post, String message) {
    return _$updatePostAsyncAction.run(() => super.updatePost(post, message));
  }

  final _$logoutAsyncAction = AsyncAction('_PostsControllerBase.logout');

  @override
  Future<bool> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
posts: ${posts},
user: ${user},
errorMessage: ${errorMessage}
    ''';
  }
}

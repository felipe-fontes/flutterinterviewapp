import 'package:flutter/widgets.dart';
import 'package:interviewapp/modules/posts/infra/contracts/post_datasource.dart';
import 'package:interviewapp/modules/posts/infra/models/post_model.dart';
import 'package:interviewapp/modules/users/infra/models/user_model.dart';

class PostDataSourceImpl implements PostDataSource {
  List<PostModel> _db = <PostModel>[
    PostModel(
        id: UniqueKey().toString(),
        user: UserModel(id: UniqueKey().toString(), name: 'UserA'),
        date: DateTime.now().subtract(Duration(days: 1, hours: 1, seconds: 1)),
        message:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard'),
    PostModel(
        id: UniqueKey().toString(),
        user: UserModel(id: UniqueKey().toString(), name: 'UserB'),
        date:
            DateTime.now().subtract(Duration(days: 2, hours: 21, seconds: 13)),
        message:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard'),
    PostModel(
        id: UniqueKey().toString(),
        user: UserModel(id: UniqueKey().toString(), name: 'UserC'),
        date: DateTime.now().subtract(Duration(days: 31, hours: 6, seconds: 4)),
        message:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard'),
    PostModel(
        id: UniqueKey().toString(),
        user: UserModel(id: UniqueKey().toString(), name: 'UserA'),
        date: DateTime.now()
            .subtract(Duration(days: 645, hours: 56, seconds: 32)),
        message:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard'),
    PostModel(
        id: UniqueKey().toString(),
        user: UserModel(id: UniqueKey().toString(), name: 'UserA'),
        date: DateTime.now().subtract(Duration(days: 7, hours: 2, seconds: 5)),
        message:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard'),
    PostModel(
        id: UniqueKey().toString(),
        user: UserModel(id: UniqueKey().toString(), name: 'UserB'),
        date: DateTime.now().subtract(Duration(days: 6, hours: 7, seconds: 8)),
        message:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard')
  ];

  @override
  Future<PostModel> add(String message, String userId, DateTime date) {
    final post = PostModel(
        id: UniqueKey().toString(),
        user: UserModel(id: userId),
        date: date,
        message: message);

    _db.add(post);
    return Future.value(post);
  }

  @override
  Future<bool> delete(String postId) {
    _db.removeWhere((x) => x.id == postId);
    return Future.value(true);
  }

  @override
  Future<List<PostModel>> getAll() {
    _db.sort(
      (a, b) {
        return a.date.isBefore(b.date) ? 1 : 0;
      },
    );
    return Future.value(_db);
  }

  @override
  Future<PostModel> update(String postId, String message, DateTime date) {
    final post = _db.firstWhere((x) => x.id == postId);
    if (post != null) {
      final newPost =
          PostModel(id: postId, user: post.user, date: date, message: message);
      return Future.value(newPost);
    }
    return Future.value(null);
  }
}

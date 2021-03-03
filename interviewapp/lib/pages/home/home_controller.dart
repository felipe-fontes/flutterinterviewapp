import 'package:mobx/mobx.dart';

import 'package:interviewapp/modules/news/domain/usecases/get_news.dart';
import 'package:interviewapp/modules/posts/domain/usecases/add_post.dart';
import 'package:interviewapp/modules/posts/domain/usecases/get_posts.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final AddPost _addPost;
  final GetPosts _getPosts;
  final GetNews _getNews;
  _HomeControllerBase(
    this._addPost,
    this._getPosts,
    this._getNews,
  );
}

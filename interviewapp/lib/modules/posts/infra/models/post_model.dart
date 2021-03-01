import 'package:interviewapp/modules/posts/domain/entities/post.dart';
import 'package:interviewapp/modules/users/infra/models/user_model.dart';

class PostModel extends Post {
  final String id;
  final String message;
  final String pictureUrl;
  final DateTime date;
  final UserModel user;

  PostModel({this.id, this.user, this.message, this.pictureUrl, this.date});
}

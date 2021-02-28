import 'package:interviewapp/modules/users/domain/entities/user.dart';

class Post {
  final String id;
  final String message;
  final String pictureUrl;
  final DateTime date;
  final User user;

  Post({this.id, this.user, this.message, this.pictureUrl, this.date});
}

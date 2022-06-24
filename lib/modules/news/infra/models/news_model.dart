import 'package:interviewapp/modules/news/domain/entities/news.dart';

class NewsModel extends News {
  final String name;
  final String message;
  final String profilePicture;
  final DateTime date;

  NewsModel({this.name, this.message, this.profilePicture, this.date});
}

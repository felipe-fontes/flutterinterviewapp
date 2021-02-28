import 'package:interviewapp/modules/news/domain/entities/news.dart';

abstract class NewsRepository {
  Future<List<News>> get();
}

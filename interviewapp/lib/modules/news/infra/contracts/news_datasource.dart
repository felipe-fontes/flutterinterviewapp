import 'package:interviewapp/modules/news/infra/models/news_model.dart';

abstract class NewsDataSource {
  Future<List<NewsModel>> getAll();
}

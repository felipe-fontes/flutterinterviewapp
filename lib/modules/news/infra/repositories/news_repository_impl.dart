import 'package:interviewapp/modules/news/domain/contracts/news_repository.dart';
import 'package:interviewapp/modules/news/domain/entities/news.dart';
import 'package:interviewapp/modules/news/infra/contracts/news_datasource.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsDataSource _newsDataSource;

  NewsRepositoryImpl(this._newsDataSource);
  @override
  Future<List<News>> getAll() {
    return _newsDataSource.getAll();
  }
}

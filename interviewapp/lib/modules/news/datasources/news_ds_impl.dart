import 'package:interviewapp/modules/news/datasources/models/news_result.dart';
import 'package:interviewapp/modules/news/infra/contracts/news_datasource.dart';
import 'package:interviewapp/modules/news/infra/models/news_model.dart';
import 'package:dio/dio.dart';

class NewsDataSourceImpl implements NewsDataSource {
  final Dio _dio;

  NewsDataSourceImpl(this._dio);
  @override
  Future<List<NewsModel>> getAll() async {
    try {
      final response = await _dio
          .get("https://gb-mobile-app-teste.s3.amazonaws.com/data.json");
      print(response);
      final body = NewsRootResult.fromMap(response.data);
      final newsModelList = body.news
          .map((x) => NewsModel(
              name: x.user.name,
              message: x.message.content,
              date: x.message.createdAt,
              profilePicture: x.user.profilePicture))
          .toList();

      return newsModelList;
    } catch (e) {
      print(e);
      return null;
    }
  }
}

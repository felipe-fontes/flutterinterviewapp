import 'package:flutter_test/flutter_test.dart';
import 'package:interviewapp/modules/news/infra/contracts/news_datasource.dart';
import 'package:interviewapp/modules/news/infra/models/news_model.dart';
import 'package:interviewapp/modules/news/infra/repositories/news_repository_impl.dart';
import 'package:mockito/mockito.dart';

class NewsDataSourceMock extends Mock implements NewsDataSource {}

main() {
  final dataSource = NewsDataSourceMock();
  final repository = NewsRepositoryImpl(dataSource);

  test('Should return List<NewsModel>', () async {
    when(dataSource.getAll()).thenAnswer((_) async => <NewsModel>[]);

    final result = await repository.getAll();

    expect(result, isA<List<NewsModel>>());
  });
}

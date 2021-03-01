import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interviewapp/modules/news/datasources/news_ds_impl.dart';
import 'package:interviewapp/modules/news/infra/models/news_model.dart';
import 'package:mockito/mockito.dart';

import 'utils/news_json_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final dataSource = NewsDataSourceImpl(dio);

  test('Should return List<NewsModel>', () async {
    when(dio.get(any)).thenAnswer(
        (_) async => Response(data: jsonDecode(newsResult), statusCode: 200));

    final result = await dataSource.getAll();

    expect(result, isA<List<NewsModel>>());
  });
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interviewapp/modules/news/datasources/models/news_result.dart';
import 'package:interviewapp/modules/news/datasources/news_ds_impl.dart';
import 'package:interviewapp/modules/news/infra/contracts/news_datasource.dart';
import 'package:interviewapp/modules/news/infra/models/news_model.dart';
import 'package:interviewapp/modules/news/infra/repositories/news_repository_impl.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

class ResponseMock extends Mock implements Response {}

main() {
  final dio = DioMock();
  final dataSource = NewsDataSourceImpl(dio);

  test('Should return List<NewsModel>', () async {
    final responseMock = ResponseMock();
    final dynamicObj = json.encode({
      "news": [
        {
          "user": {
            "name": "O Boticário",
            "profile_picture":
                "https://pbs.twimg.com/profile_images/1240676323913347074/Gg09hEPx_400x400.jpg"
          },
          "message": {
            "content":
                "Além disso, nossos funcionários e familiares receberão kits de proteção. Afinal, o cuidado começa aqui dentro, né?",
            "created_at": "2020-02-02T16:10:33Z"
          }
        }
      ]
    });

    when(responseMock.data).thenReturn(dynamicObj);
    when(dio.get(any)).thenAnswer((_) async => responseMock);

    final result = await dataSource.getAll();

    expect(result, isA<List<NewsModel>>());
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interviewapp/modules/news/domain/contracts/news_repository.dart';
import 'package:interviewapp/modules/news/domain/entities/news.dart';
import 'package:interviewapp/modules/news/domain/errors/errors.dart';
import 'package:interviewapp/modules/news/domain/usecases/get_news.dart';
import 'package:mockito/mockito.dart';

class NewsRepositoryMock extends Mock implements NewsRepository {}

main() {
  final repository = NewsRepositoryMock();
  final usecase = GetNewsImpl(repository);

  test('Should return a List<News>', () async {
    when(repository.getAll()).thenAnswer((_) async => <News>[]);

    final result = await usecase();

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<News>>());
  });

  test('Should return UnableToGet when repository return null', () async {
    when(repository.getAll()).thenAnswer((_) async => null);

    final result = await usecase();

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<NewsError>());
  });

  test('Should return UnableToGet when repository throws any Exception',
      () async {
    when(repository.getAll()).thenThrow(() => Exception());

    final result = await usecase();

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<NewsError>());
  });
}

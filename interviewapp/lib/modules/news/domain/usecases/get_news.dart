import 'package:interviewapp/modules/news/domain/contracts/news_repository.dart';
import 'package:interviewapp/modules/news/domain/entities/news.dart';
import 'package:dartz/dartz.dart';
import 'package:interviewapp/modules/news/domain/errors/errors.dart';

abstract class GetNews {
  Future<Either<NewsError, List<News>>> call();
}

class GetNewsImpl implements GetNews {
  final NewsRepository _newsRepository;

  GetNewsImpl(this._newsRepository);

  @override
  Future<Either<NewsError, List<News>>> call() async {
    try {
      final response = await _newsRepository.getAll();

      if (response == null) {
        return Left(UnableToGet());
      }

      return Right(response);
    } catch (ex) {
      print(ex);
      return Left(UnableToGet());
    }
  }
}

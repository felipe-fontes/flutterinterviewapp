import 'package:interviewapp/modules/news/domain/entities/news.dart';
import 'package:interviewapp/modules/news/domain/usecases/get_news.dart';
import 'package:mobx/mobx.dart';
part 'news_controller.g.dart';

class NewsController = _NewsControllerBase with _$NewsController;

abstract class _NewsControllerBase with Store {
  final GetNews _getNews;

  _NewsControllerBase(this._getNews);

  @observable
  ObservableList<News> news = ObservableList<News>();

  @action
  Future getNews() async {
    final response = await _getNews();
    if (response.isRight()) {
      news.clear();
      final list = response | null;
      news.addAll(list);
    }
    print(response);
  }
}

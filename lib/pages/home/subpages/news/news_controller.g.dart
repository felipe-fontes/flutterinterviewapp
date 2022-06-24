// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsController on _NewsControllerBase, Store {
  final _$newsAtom = Atom(name: '_NewsControllerBase.news');

  @override
  ObservableList<News> get news {
    _$newsAtom.reportRead();
    return super.news;
  }

  @override
  set news(ObservableList<News> value) {
    _$newsAtom.reportWrite(value, super.news, () {
      super.news = value;
    });
  }

  final _$getNewsAsyncAction = AsyncAction('_NewsControllerBase.getNews');

  @override
  Future<dynamic> getNews() {
    return _$getNewsAsyncAction.run(() => super.getNews());
  }

  @override
  String toString() {
    return '''
news: ${news}
    ''';
  }
}

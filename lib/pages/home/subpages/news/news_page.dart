import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:interviewapp/pages/home/subpages/news/news_controller.dart';
import 'package:interviewapp/shared/utils/colors.dart';
import 'package:interviewapp/shared/utils/strings.dart';
import 'package:interviewapp/widgets/my_card.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsPage extends StatefulWidget {
  const NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsController _newsController;

  @override
  void initState() {
    _newsController = GetIt.I<NewsController>();
    _newsController.getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return CustomScrollView(slivers: [
        _buildSliverBar(context),
        _buildSliverList(),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            height: 80,
          ),
        ),
      ]);
    });
  }

  SliverList _buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, i) {
        return Container(
          padding: EdgeInsets.only(
            bottom: 20,
          ),
          child: MyCard(
            shadowColor: AppColors.boticario900.withOpacity(0.4),
            bolderRadius: 10,
            child: buildCardContent(i),
          ),
        );
      }, childCount: _newsController.news.length),
    );
  }

  SliverAppBar _buildSliverBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.boticario50,
      expandedHeight: 150,
      flexibleSpace: Column(
        children: [
          Flexible(
            flex: 1,
            child: _buildHeaderContent(context),
          ),
          _buildHeaderWhiteCorner(),
        ],
      ),
    );
  }

  Container _buildHeaderWhiteCorner() {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [],
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
          bottom: Radius.circular(0),
        ),
      ),
    );
  }

  Container _buildHeaderContent(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: AppColors.backgroundWhite,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: '${AppString.fullOf} ',
                ),
                TextSpan(
                  text: '${AppString.news} ',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: AppColors.backgroundWhite,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextSpan(
                  text: '${AppString.toTell} ',
                ),
                TextSpan(
                  text: '\n${AppString.checkThisFeed} ',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildCardContent(int i) {
    return Container(
      padding: EdgeInsets.all(
        10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _newsController.news[i].name,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: AppColors.boticario900,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            timeago.format(
              _newsController.news[i].date,
              locale: 'br',
            ),
            style: TextStyle(
              color: AppColors.boticario900,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(_newsController.news[i].message),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

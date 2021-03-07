import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:interviewapp/pages/home/subpages/news/news_controller.dart';
import 'package:interviewapp/shared/utils/colors.dart';
import 'package:interviewapp/widgets/gradient_card.dart';
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Observer(builder: (_) {
        return ListView.separated(
          itemCount: _newsController.news.length,
          padding: EdgeInsets.only(bottom: 16, left: 8, right: 8),
          separatorBuilder: (c, i) => SizedBox(
            height: 20,
          ),
          itemBuilder: (context, i) => GradientCard(
            startColor: AppColors.backgroundWhite,
            endColor: AppColors.backgroundWhite,
            shadowColor: AppColors.boticario100.withOpacity(0.9),
            bolderRadius: 10,
            child: buildCardContent(i),
          ),
        );
      }),
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
          Row(
            children: [
              Text(
                _newsController.news[i].name,
                style: TextStyle(
                  color: AppColors.backgroundWhite,
                  fontSize: 14,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                timeago.format(_newsController.news[i].date),
                style: TextStyle(
                  color: AppColors.backgroundWhite,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _newsController.news[i].message,
            style: TextStyle(
              color: AppColors.backgroundWhite,
            ),
          ),
        ],
      ),
    );
  }
}

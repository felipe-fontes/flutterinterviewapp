import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:interviewapp/pages/home/subpages/post/posts_controller.dart';
import 'package:interviewapp/shared/utils/colors.dart';
import 'package:interviewapp/widgets/gradient_card.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostsPage extends StatefulWidget {
  PostsPage({Key key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  PostsController _postController;

  @override
  void initState() {
    _postController = GetIt.I<PostsController>();
    _postController.getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Observer(builder: (_) {
        return ListView.separated(
          itemCount: _postController.posts.length,
          padding: EdgeInsets.only(bottom: 16, left: 8, right: 8),
          separatorBuilder: (c, i) => SizedBox(
            height: 20,
          ),
          itemBuilder: (context, i) => GradientCard(
            startColor: AppColors.companyColor,
            endColor: AppColors.companyColorSmoth,
            shadowColor: AppColors.companyColor.withOpacity(0.9),
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
                _postController.posts[i].user.name,
                style: TextStyle(
                  color: AppColors.background,
                  fontSize: 14,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                timeago.format(_postController.posts[i].date),
                style: TextStyle(
                  color: AppColors.background,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _postController.posts[i].message,
            style: TextStyle(
              color: AppColors.background,
            ),
          ),
        ],
      ),
    );
  }
}

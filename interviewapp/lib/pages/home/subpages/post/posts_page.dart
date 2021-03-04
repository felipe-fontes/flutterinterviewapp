import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:interviewapp/pages/home/subpages/post/posts_controller.dart';
import 'package:interviewapp/shared/utils/colors.dart';
import 'package:intl/intl.dart';

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
      padding: const EdgeInsets.all(8.0),
      child: Observer(builder: (_) {
        return ListView.builder(
          itemCount: _postController.posts.length,
          itemBuilder: (context, i) => Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.companyColor,
                    AppColors.companyColorSmoth,
                  ],
                ),
              ),
              padding: const EdgeInsets.all(8.0),
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
                        DateFormat('yyyy-MM-dd – hh:mm')
                            .format(_postController.posts[i].date),
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
            ),
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:interviewapp/pages/home/subpages/post/posts_controller.dart';
import 'package:interviewapp/shared/utils/colors.dart';

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
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.gradient1,
                    AppColors.gradient1.withOpacity(0.9),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _postController.posts[i].message,
                style: TextStyle(color: AppColors.background),
              ),
            ),
          ),
        );
      }),
    );
  }
}

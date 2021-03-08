import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:interviewapp/pages/home/subpages/news/news_controller.dart';
import 'package:interviewapp/pages/home/subpages/news/news_page.dart';
import 'package:interviewapp/pages/home/subpages/post/posts_controller.dart';
import 'package:interviewapp/pages/home/subpages/post/posts_page.dart';
import 'package:interviewapp/pages/home/subpages/utils/show_message_dialog.dart';
import 'package:interviewapp/shared/utils/colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  PostsController _postsController;
  TextEditingController _messageController;

  FocusNode inputFieldNode;
  int activeIndex = 0;
  @override
  void initState() {
    _postsController = GetIt.I<PostsController>();
    final newsController = GetIt.I<NewsController>();
    newsController.getNews();
    _messageController = TextEditingController();
    inputFieldNode = FocusNode();

    super.initState();
  }

  final iconList = [
    Icons.forum_outlined,
    Icons.rss_feed_outlined,
  ];

  @override
  void dispose() {
    inputFieldNode.dispose();
    super.dispose();
  }

  List<Widget> _widgetOptions = <Widget>[
    PostsPage(),
    NewsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: _widgetOptions[activeIndex],
        floatingActionButton: buildActionButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: buildNavBar(),
      ),
    );
  }

  FloatingActionButton buildActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showMessageDialog(
          context,
          _messageController,
          this.inputFieldNode,
          _postsController,
          (text) async {
            final success = await _postsController.sendPost(text);
            if (success) {
              _messageController.text = '';
              Navigator.pop(context);
            } else {
              inputFieldNode.requestFocus();
            }
          },
        );
      },
      child: Image.asset(
        'assets/icons/icon_newpost.png',
        width: 30,
        height: 30,
        color: AppColors.backgroundWhite,
      ),
      backgroundColor: AppColors.boticario900,
    );
  }

  AnimatedBottomNavigationBar buildNavBar() {
    return AnimatedBottomNavigationBar(
      icons: iconList,
      activeIndex: activeIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.defaultEdge,
      backgroundColor: AppColors.boticario50,
      leftCornerRadius: 4,
      rightCornerRadius: 4,
      activeColor: AppColors.backgroundWhite,
      onTap: (i) => setState(() => activeIndex = i),
    );
  }
}

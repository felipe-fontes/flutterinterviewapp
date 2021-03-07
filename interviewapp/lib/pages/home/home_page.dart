import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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
  @override
  void initState() {
    _postsController = GetIt.I<PostsController>();
    _messageController = TextEditingController();
    inputFieldNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    inputFieldNode.dispose();
    super.dispose();
  }

  List<Widget> _widgetOptions = <Widget>[
    PostsPage(),
    NewsPage(),
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetOptions[_selectedIndex],
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
      child: Icon(
        Icons.navigation,
        color: AppColors.backgroundWhite,
      ),
      backgroundColor: AppColors.boticario100,
    );
  }

  FluidNavBar buildNavBar() {
    return FluidNavBar(
      animationFactor: 0.5,
      style: FluidNavBarStyle(
        barBackgroundColor: AppColors.boticario100,
        iconBackgroundColor: AppColors.boticario100,
        iconSelectedForegroundColor: AppColors.backgroundWhite,
        iconUnselectedForegroundColor: AppColors.backgroundWhite,
      ),
      icons: [
        FluidNavBarIcon(
          svgPath: "assets/icons/forum-outline.svg",
        ),
        FluidNavBarIcon(
          svgPath: "assets/icons/rss.svg",
        ),
      ],
      onChange: (i) => setState(() => _selectedIndex = i),
    );
  }
}

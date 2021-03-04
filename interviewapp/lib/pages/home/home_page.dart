import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:interviewapp/pages/home/home_controller.dart';
import 'package:interviewapp/pages/home/subpages/news/news_page.dart';
import 'package:interviewapp/pages/home/subpages/post/posts_page.dart';
import 'package:interviewapp/shared/utils/colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  HomeController _homeController;
  TextEditingController _messageController;

  FocusNode inputFieldNode;
  @override
  void initState() {
    _homeController = GetIt.I<HomeController>();
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
        showMessageDialog(context);
      },
      child: Icon(
        Icons.navigation,
        color: AppColors.companyColor,
      ),
      backgroundColor: AppColors.background,
    );
  }

  FluidNavBar buildNavBar() {
    return FluidNavBar(
      animationFactor: 0.5,
      style: FluidNavBarStyle(
        barBackgroundColor: AppColors.companyColor,
        iconBackgroundColor: AppColors.companyColor,
        iconSelectedForegroundColor: AppColors.background,
        iconUnselectedForegroundColor: AppColors.background,
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

  void showMessageDialog(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      backgroundColor: AppColors.background,
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 10,
              ),
              child: Observer(
                builder: (_) {
                  return TextField(
                    controller: _messageController,
                    onChanged: _homeController.setMessage,
                    autofocus: true,
                    focusNode: inputFieldNode,
                    onSubmitted: (text) async {
                      final success = await _homeController.sendPost();

                      if (success) {
                        _messageController.text = _homeController.message;
                        Navigator.pop(context);
                      } else {
                        FocusScope.of(context).requestFocus(inputFieldNode);
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'What will be you post of the day',
                      errorText: _homeController.errorMessage.isNotEmpty
                          ? _homeController.errorMessage
                          : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

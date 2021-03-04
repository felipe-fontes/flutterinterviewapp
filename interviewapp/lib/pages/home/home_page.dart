import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
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
  @override
  void initState() {
    _homeController = GetIt.I<HomeController>();
    super.initState();
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: Icon(
            Icons.navigation,
            color: AppColors.companyColor,
          ),
          backgroundColor: AppColors.background,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: FluidNavBar(
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
        ),
      ),
    );
  }
}

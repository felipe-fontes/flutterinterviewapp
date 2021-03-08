import 'package:flutter/material.dart';
import 'package:interviewapp/setup.dart';
import 'package:interviewapp/shared/utils/colors.dart';
import 'package:interviewapp/widgets/my_splashscreen.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _asyncAppLoad();
  }

  FutureBuilder<Widget> _asyncAppLoad() {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: getFirstPage(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else {
          // Loading is done, return the app:
          return _buildApp(snapshot.data);
        }
      },
    );
  }

  Widget _buildApp(Widget home) {
    return MaterialApp(
      home: home,
      theme: _buildTheme(),
    );
  }

  ThemeData _buildTheme() {
    final ThemeData base = ThemeData.light();
    final theme = base.copyWith(
      accentColor: AppColors.boticario900,
      primaryColor: AppColors.boticario50,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: AppColors.boticario50,
        colorScheme: base.colorScheme.copyWith(
          secondary: AppColors.boticario900,
        ),
      ),
      buttonBarTheme: base.buttonBarTheme.copyWith(
        buttonTextTheme: ButtonTextTheme.accent,
      ),
      scaffoldBackgroundColor: AppColors.backgroundWhite,
      cardColor: AppColors.backgroundWhite,
      textSelectionColor: AppColors.boticario50,
      errorColor: AppColors.error,
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
      primaryIconTheme: base.iconTheme.copyWith(
        color: AppColors.boticario900,
      ),
      indicatorColor: AppColors.boticario300,
      backgroundColor: AppColors.backgroundWhite,
      buttonColor: AppColors.boticario50,
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: AppColors.boticario900,
          ),
        ),
        border: OutlineInputBorder(),
      ),
      cursorColor: AppColors.boticario900,
      // TODO: Add the icon themes (103)
    );

    return theme;
  }

  TextTheme _buildTextTheme(TextTheme base) {
    return base
        .copyWith(
          headline5: base.headline5.copyWith(
            fontWeight: FontWeight.w400,
          ),
          headline6: base.headline6.copyWith(fontSize: 18.0),
          caption: base.caption.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 14.0,
          ),
          bodyText1: base.bodyText1.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
          bodyText2: base.bodyText1.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        )
        .apply(
          fontFamily: 'NunitoSans',
          decorationColor: AppColors.boticario900,
          displayColor: AppColors.boticario900,
          bodyColor: AppColors.boticario900,
        );
  }
}

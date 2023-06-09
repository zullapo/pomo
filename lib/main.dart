import 'package:flutter/material.dart';
import 'package:pomo/app/home.dart';
import 'package:pomo/app/shared/colors.dart';
import 'package:pomo/app/shared/fonts.dart';
import 'package:responsive_ui/responsive_ui.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.setGlobalBreakPoints(768, 992, 1200, 1400);
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: "Pomo",
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: AppColors.skyBlue,
          secondary: AppColors.yellow,
        ),
        textTheme: theme.textTheme.copyWith(
          bodyMedium: latoW400(
            size: 14,
            color: AppColors.black,
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: latoBold(
            size: 20,
            color: AppColors.white,
          ),
        ),
      ),
      initialRoute: '/home',
      routes: {
        "/home": (context) => const Home(),
      },
    );
  }
}

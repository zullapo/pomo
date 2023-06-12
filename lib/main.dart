import 'package:flutter/material.dart';
import 'package:pomo/app/home.dart';
import 'package:pomo/app/shared/colors.dart';
import 'package:pomo/app/shared/fonts/lato.dart';
import 'package:pomo/app/shared/fonts/roboto.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
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
          titleLarge: robotoMedium(
            size: 22,
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomo/app/home.dart';
import 'package:pomo/app/riverpod/timer_color_provider.dart';
import 'package:pomo/app/shared/colors.dart';
import 'package:pomo/app/shared/fonts/lato.dart';
import 'package:pomo/app/shared/fonts/roboto.dart';

void main() => runApp(const ProviderScope(child: Main()));

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final timerColor = ref.watch(timerColorProvider);
        return MaterialApp(
          title: "Pomo",
          debugShowCheckedModeBanner: false,
          theme: theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(
              primary: timerColor,
              secondary: AppColors.yellow,
            ),
            textTheme: theme.textTheme.copyWith(
              titleLarge: robotoMedium(
                size: 22,
                color: AppColors.black,
              ),
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: timerColor,
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
      },
    );
  }
}

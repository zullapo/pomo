import 'package:flutter/material.dart';
import 'package:pomo/app/home.dart';
import 'package:responsive_ui/responsive_ui.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.setGlobalBreakPoints(768, 992, 1200, 1400);
    return MaterialApp(
      title: "Pomo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Lato",
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        "/home": (context) => const Home(),
      },
    );
  }
}
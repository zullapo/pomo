import 'package:flutter/material.dart';
import 'package:pomo/app/shared/colors.dart';
import 'package:pomo/app/shared/fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.skyBlue,
        title: Text(
          "Pomo",
          style: latoW400(
            size: 14,
            color: AppColors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              style: latoW400(
                size: 14,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

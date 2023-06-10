import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomo/app/shared/colors.dart';
import 'package:pomo/app/shared/constants.dart';
import 'package:pomo/app/shared/fonts.dart';
import 'package:pomo/app/widgets/timer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyPage = SafeArea(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              AppTimer(
                dateTime: DateTime.now(),
              ),
            ],
          ),
        ),
      ),
    );

    return !isIos
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.skyBlue,
              title: const Text(
                "Pomo",
              ),
            ),
            body: bodyPage,
          )
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              backgroundColor: AppColors.skyBlue,
              middle: Text(
                "Pomo",
                style: latoBold(
                  size: 20,
                  color: AppColors.white,
                ),
              ),
            ),
            child: bodyPage,
          );
  }
}

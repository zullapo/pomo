import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomo/app/shared/colors.dart';
import 'package:pomo/app/shared/constants.dart';
import 'package:pomo/app/widgets/timer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final AppBar appBar = AppBar(
      backgroundColor: AppColors.skyBlue,
      title: const Text(
        "Pomo",
      ),
    );

    final double availableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final bodyPage = SafeArea(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: availableHeight,
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppTimer(
                    dateTime: DateTime.now(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    return !isIos
        ? Scaffold(
            appBar: appBar,
            body: bodyPage,
          )
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              backgroundColor: AppColors.skyBlue,
              middle: Text(
                "Pomo",
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
            child: bodyPage,
          );
  }
}

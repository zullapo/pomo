import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomo/app/shared/colors.dart';
import 'package:pomo/app/shared/constants.dart';
import 'package:pomo/app/widgets/start_button.dart';
import 'package:pomo/app/widgets/timer.dart';
import 'package:responsive_ui/responsive_ui.dart';

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
          child: Responsive(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runSpacing: 15.0,
            children: [
              Div(
                division: const Division(colS: 12),
                child: Column(
                  children: [
                    AppTimer(
                      dateTime: DateTime.now(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const StartButton(),
                  ],
                ),
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

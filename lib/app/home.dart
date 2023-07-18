import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          child: const Responsive(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runSpacing: 15.0,
            children: [
              Div(
                division: Division(colS: 12),
                child: Column(
                  children: [
                    AppTimer(),
                    SizedBox(
                      height: 15,
                    ),
                    StartButton(),
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
              middle: Text(
                "Pomo",
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
            child: bodyPage,
          );
  }
}

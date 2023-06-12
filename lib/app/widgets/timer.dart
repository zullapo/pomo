import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pomo/app/shared/colors.dart';

class AppTimer extends StatelessWidget {
  final DateTime dateTime;

  const AppTimer({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat("HH:mm:ss").format(dateTime);

    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: AppColors.skyBlue,
        ),
      ),
      child: Center(
        child: Text(
          formattedTime,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}

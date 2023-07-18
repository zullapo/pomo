import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomo/app/riverpod/timer_display_provider.dart';
import 'package:pomo/app/shared/colors.dart';

class AppTimer extends ConsumerWidget {
  const AppTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var timerDisplay = ref.watch(
      timerDisplayProvider,
    );

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
          timerDisplay,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}

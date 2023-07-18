import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomo/app/riverpod/break_timer_duration_provider.dart';
import 'package:pomo/app/riverpod/flag_provider.dart';
import 'package:pomo/app/riverpod/stopwatch_provider.dart';
import 'package:pomo/app/riverpod/timer_color_provider.dart';
import 'package:pomo/app/riverpod/timer_display_provider.dart';
import 'package:pomo/app/riverpod/timer_duration_provider.dart';
import 'package:pomo/app/riverpod/timer_provider.dart';
import 'package:pomo/app/shared/colors.dart';
import 'package:pomo/app/shared/utils/format_duration.dart';

class StartButton extends ConsumerWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var started = ref.watch(
      flagProvider("startButtonStarted"),
    );

    var stopwatch = ref.watch(
      stopwatchProvider,
    );

    var currentTimerDuration = ref.watch(
      currentTimerDurationProvider.notifier,
    );

    var breakTimerDurationFlag = ref.watch(
      flagProvider("breakTimerDuration"),
    );

    void stop() {
      ref.read(timerProvider)?.cancel();
      ref.read(stopwatchProvider).stop();
    }

    void reset() {
      ref.read(stopwatchProvider).reset();
    }

    void displayTimer({
      required Duration duration,
    }) {
      String timerDisplay = formatDuration(duration);
      ref.read(timerDisplayProvider.notifier).state = timerDisplay;
    }

    ref.listen(currentTimerDurationProvider, (_, duration) {
      if (duration.inSeconds == 0) {
        if (!breakTimerDurationFlag) {
          ref.read(currentTimerDurationProvider.notifier).state =
              ref.read(breakTimerDurationProvider);
        } else {
          ref.read(currentTimerDurationProvider.notifier).state =
              ref.read(timerDurationProvider);
        }
        ref.read(flagProvider("breakTimerDuration").notifier).state = !breakTimerDurationFlag;
        stop();
        reset();
        ref.read(flagProvider("startButtonStarted").notifier).state = false;
      }
    });

    ref.listen(flagProvider("breakTimerDuration"), (_, value) {
      if (value) {
        ref.read(timerColorProvider.notifier).state = AppColors.pomodoro;
      } else {
        ref.read(timerColorProvider.notifier).state = AppColors.skyBlue;
      }
    });

    void start() {
      if (!started) {
        displayTimer(
          duration: currentTimerDuration.state,
        );
        ref.read(timerProvider.notifier).state =
            Timer.periodic(const Duration(seconds: 1), (timer) {
          ref.read(currentTimerDurationProvider.notifier).state -=
              const Duration(seconds: 1);
          displayTimer(duration: currentTimerDuration.state);
          if (!stopwatch.isRunning) {
            stopwatch.start();
          }
        });
      } else {
        stop();
      }
      ref.read(flagProvider("startButtonStarted").notifier).state = !started;
    }

    return ElevatedButton(
      onPressed: start,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20.0),
        shape: const CircleBorder(
          side: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      child: Icon(
        !started ? Icons.play_arrow : Icons.pause,
      ),
    );
  }
}

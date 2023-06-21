import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomo/app/riverpod/family_state_providers.dart';
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

    var timerDuration = ref.watch(
      timerDurationProvider,
    );

    void stop() {
      ref.read(timerProvider.notifier).state.cancel();
      ref.read(stopwatchProvider.notifier).state.stop();
    }

    void reset() {
      ref.read(stopwatchProvider.notifier).state.reset();
    }

    void start() {
      if (!started) {
        Timer periodicTimer =
            Timer.periodic(const Duration(seconds: 1), (timer) {
          Duration duration = stopwatch.elapsedTicks < 0
              ? Duration(seconds: timerDuration) - stopwatch.elapsed
              : Duration(seconds: timerDuration + 1) - stopwatch.elapsed;
          if (duration.inSeconds == 0) {
            stop();
            reset();
            ref.read(flagProvider("startButtonStarted").notifier).state = false;
            ref.read(timerDisplayProvider.notifier).state =
                formatDuration(Duration(seconds: timerDuration));
          } else {
            String timerDisplay = formatDuration(duration);
            ref.read(timerDisplayProvider.notifier).state = timerDisplay;
          }
        });
        ref.read(timerProvider.notifier).state = periodicTimer;
        stopwatch.start();
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

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomo/app/shared/utils/format_duration.dart';

final flagProvider = StateProvider.autoDispose.family<bool, String>(
  (ref, value) => false,
);

final timerDurationProvider = StateProvider.autoDispose<Duration>(
  (ref) => const Duration(minutes: 25),
);

final currentTimerDurationProvider = StateProvider(
  (ref) => ref.read(timerDurationProvider),
);

final stopwatchProvider = StateProvider<Stopwatch>(
  (ref) => Stopwatch(),
);

final timerProvider = StateProvider<Timer?>(
  (ref) => null,
);

final timerDisplayProvider = StateProvider.autoDispose<String>(
  (ref) {
    Duration timerDuration = ref.read(timerDurationProvider);
    String display = formatDuration(timerDuration);
    return display;
  },
);

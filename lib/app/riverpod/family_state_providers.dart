import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomo/app/shared/utils/format_duration.dart';

final flagProvider = StateProvider.family<bool, String>(
  (ref, value) => false,
);

final timerDurationProvider = StateProvider<int>(
  (ref) => 15,
);

final stopwatchProvider = StateProvider<Stopwatch>(
  (ref) => Stopwatch(),
);

final timerProvider = StateProvider<Timer>(
  (ref) => Timer(const Duration(seconds: 0), () {}),
);

final timerDisplayProvider = StateProvider<String>(
  (ref) {
    int timerDuration = ref.watch(timerDurationProvider);
    String display = formatDuration(Duration(seconds: timerDuration));
    return display;
  },
);

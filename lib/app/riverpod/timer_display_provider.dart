import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomo/app/riverpod/timer_duration_provider.dart';
import 'package:pomo/app/shared/utils/format_duration.dart';

final timerDisplayProvider = StateProvider.autoDispose<String>(
  (ref) {
    Duration timerDuration = ref.read(timerDurationProvider);
    String display = formatDuration(timerDuration);
    return display;
  },
);

import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerDurationProvider = StateProvider.autoDispose<Duration>(
  (ref) => const Duration(minutes: 25),
);

final currentTimerDurationProvider = StateProvider.autoDispose(
  (ref) => ref.read(timerDurationProvider),
);

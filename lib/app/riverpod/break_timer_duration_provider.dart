import 'package:flutter_riverpod/flutter_riverpod.dart';

final breakTimerDurationProvider = StateProvider.autoDispose<Duration>(
  (ref) => const Duration(
    seconds: 5,
  ),
);
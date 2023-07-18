import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerProvider = StateProvider<Timer?>(
  (ref) => null,
);

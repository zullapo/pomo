import 'package:flutter_riverpod/flutter_riverpod.dart';

final stopwatchProvider = Provider<Stopwatch>(
  (ref) => Stopwatch(),
);

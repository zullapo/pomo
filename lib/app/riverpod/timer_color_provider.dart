import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomo/app/shared/colors.dart';

final timerColorProvider = StateProvider<Color>(
  (ref) => AppColors.skyBlue,
);

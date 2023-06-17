import 'package:flutter_riverpod/flutter_riverpod.dart';

final flagProvider = StateProvider.family<bool, String>(
  (ref, value) => false,
);

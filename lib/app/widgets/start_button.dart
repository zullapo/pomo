import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomo/app/riverpod/family_state_providers.dart';

class StartButton extends ConsumerWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var started = ref.watch(
      flagProvider("startButtonStarted"),
    );

    return ElevatedButton(
      onPressed: () {
        ref.read(flagProvider("startButtonStarted").notifier).state = !started;
      },
      child: Icon(
        !started ? Icons.play_arrow : Icons.pause,
      ),
    );
  }
}

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
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20.0),
        shape: const CircleBorder(
          side: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      child: Icon(
        !started ? Icons.play_arrow : Icons.pause,
      ),
    );
  }
}

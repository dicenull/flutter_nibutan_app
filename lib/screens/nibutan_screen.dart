import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NibutanScreen extends HookConsumerWidget {
  const NibutanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = useState(1.0);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Slider(
            onChanged: (double value) {
              progress.value = value;
            },
            value: progress.value,
          ),
        ),
      ]),
    );
  }
}

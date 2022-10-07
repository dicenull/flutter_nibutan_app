import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_nibutan_app/models/nibutan_controller.dart';
import 'package:flutter_nibutan_app/models/nibutan_log.dart';
import 'package:flutter_nibutan_app/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _nibutanLogProvider =
    StateProvider.autoDispose<List<NibutanLog>>((_) => []);
final _solvedProvider = StateProvider.autoDispose((_) => false);

class NibutanScreen extends HookConsumerWidget {
  const NibutanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(nibutanProvider.select((value) => value));
    return asyncValue.maybeWhen(
      orElse: () => const SizedBox.shrink(),
      data: (state) {
        return _Screen(state.start, state.end);
      },
    );
  }
}

class _IntervalText extends StatelessWidget {
  final int start;
  final int end;

  const _IntervalText({
    Key? key,
    required this.start,
    required this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$start',
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          Text(
            '$end',
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ProgressButton extends HookConsumerWidget {
  final int middle;
  final ValueNotifier<int> low;
  final ValueNotifier<int> high;
  final ValueChanged<NibutanLog>? onTap;

  const _ProgressButton({
    Key? key,
    required this.middle,
    required this.low,
    required this.high,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IgnorePointer(
      ignoring: ref.watch(_solvedProvider),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              high.value = middle - 1;
              onTap?.call(NibutanLog(number: middle, success: false));
            },
            child: const Text(
              '<失敗',
              style: TextStyle(fontSize: 64, color: Colors.orange),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              middle.toString(),
              style: const TextStyle(fontSize: 64),
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
            onPressed: () {
              low.value = middle + 1;
              onTap?.call(NibutanLog(number: middle, success: true));
            },
            child: const Text(
              '成功>',
              style: TextStyle(fontSize: 64, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

class _Screen extends HookConsumerWidget {
  final int start;
  final int end;

  const _Screen(this.start, this.end);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final low = useState(start);
    final high = useState(end);
    final division = useState(3);

    final interval = high.value - low.value;
    final middle = (low.value + high.value) / 2;
    final progress =
        (interval > 0) ? (math.log(interval) / math.log(2)).ceil() : 0;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (progress <= 0) {
          ref.read(_solvedProvider.notifier).state = true;
        }
      });

      return;
    }, [progress]);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('にぶたん残り: $progress'),
            _ProgressButton(
              middle: middle.round(),
              low: low,
              high: high,
              onTap: (log) {
                ref.read(_nibutanLogProvider).add(log);
                division.value = division.value * 2 + 1;
              },
            ),
            _IntervalText(
              start: start,
              end: end,
            ),
            IgnorePointer(
              ignoring: true,
              child: Slider(
                min: start.toDouble(),
                max: end.toDouble(),
                onChanged: (_) {},
                divisions: division.value + 1,
                label: middle.round().toString(),
                value: middle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                color: Theme.of(context).primaryColor,
                constraints: const BoxConstraints(
                  maxHeight: 300,
                  maxWidth: 400,
                ),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: ref
                      .watch(_nibutanLogProvider.select((value) => value))
                      .map(
                        (logData) => Text(
                          logData.displayText,
                          style: TextStyle(
                            color:
                                logData.success ? Colors.blue : Colors.orange,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                ref.read(goRouterProvider).go('/setup');
              },
              child: const Text('はじめから'),
            )
          ],
        ),
      ),
    );
  }
}

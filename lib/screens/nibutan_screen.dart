import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_nibutan_app/models/nibutan_controller.dart';
import 'package:flutter_nibutan_app/models/nibutan_log.dart';
import 'package:flutter_nibutan_app/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _nibutanLogProvider =
    StateProvider.autoDispose<List<NibutanLog>>((_) => []);

class NibutanScreen extends HookConsumerWidget {
  final int firstLow;
  final int firstHigh;
  const NibutanScreen(this.firstLow, this.firstHigh, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final division = useState(3);
    final asyncValue = ref.watch(nibutanProvider.select((value) => value));

    return asyncValue.maybeWhen(
      orElse: () => const SizedBox.shrink(),
      data: (state) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('にぶたん残り: ${state.progress}'),
                _ProgressButton(
                  middle: state.middle,
                  onTap: (log) {
                    ref.read(_nibutanLogProvider).add(log);
                    division.value = division.value * 2 + 1;
                  },
                ),
                _IntervalText(
                  start: firstLow,
                  end: firstHigh,
                ),
                IgnorePointer(
                  ignoring: true,
                  child: Slider(
                    min: firstLow.toDouble(),
                    max: firstHigh.toDouble(),
                    onChanged: (_) {},
                    divisions: division.value + 1,
                    label: state.middle.toString(),
                    value: state.middle.toDouble(),
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
                                color: logData.success
                                    ? Colors.blue
                                    : Colors.orange,
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
  final ValueChanged<NibutanLog>? onTap;

  const _ProgressButton({
    Key? key,
    required this.middle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IgnorePointer(
      ignoring: ref.watch(
        nibutanProvider
            .select((state) => (state.asData?.value.progress ?? -1) <= 0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              ref.read(nibutanProvider.notifier).processDown();

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
              ref.read(nibutanProvider.notifier).processUp();

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

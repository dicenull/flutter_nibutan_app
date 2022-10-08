import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_nibutan_app/models/nibutan_state.dart';
import 'package:flutter_nibutan_app/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final setupProvider =
    StateProvider<AsyncValue<NibutanState>>((_) => const AsyncValue.loading());

class SetUpScreen extends HookConsumerWidget {
  const SetUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          const _IntervalInput(),
          TextButton(
            onPressed: ref.watch(setupProvider.select(
              (value) => value.maybeWhen(
                  orElse: () => null,
                  data: (data) {
                    if (!data.valid) return null;

                    return () {
                      final start = data.start;
                      final end = data.end;

                      ref
                          .read(goRouterProvider)
                          .go('/solve?start=$start&end=$end');
                    };
                  }),
            )),
            child: const Text(
              'にぶたん開始！',
              style: TextStyle(fontSize: 32),
            ),
          )
        ],
      ),
    );
  }
}

class _IntervalInput extends HookConsumerWidget {
  const _IntervalInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startTextCtrl = useTextEditingController();
    final endTextCtrl = useTextEditingController();

    final startUpdate = useValueListenable(startTextCtrl);
    final endUpdate = useValueListenable(endTextCtrl);
    final start = int.tryParse(startUpdate.text);
    final end = int.tryParse(endUpdate.text);

    useEffect(() {
      if (start == null || end == null) return;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(setupProvider.notifier).state = AsyncData(
          NibutanState(start: start, end: end),
        );
      });

      return;
    }, [startUpdate, endUpdate]);

    const style = TextStyle(
      fontSize: 64,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 200),
          child: TextField(
            controller: startTextCtrl,
            style: style,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(hintText: '0'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            '〜',
            style: style,
          ),
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 200),
          child: TextField(
            controller: endTextCtrl,
            style: style,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(hintText: '100'),
          ),
        ),
      ],
    );
  }
}

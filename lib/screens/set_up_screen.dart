import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_nibutan_app/models/nibutan_controller.dart';
import 'package:flutter_nibutan_app/models/nibutan_state.dart';
import 'package:flutter_nibutan_app/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SetUpScreen extends HookConsumerWidget {
  const SetUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          const _IntervalInput(),
          TextButton(
            onPressed: ref.watch(nibutanProvider.select(
              (value) => value.maybeWhen(
                orElse: () => false,
                data: (data) => data.valid,
              ),
            ))
                ? () {
                    ref.read(goRouterProvider).go('/solve');
                  }
                : null,
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

    useEffect(() {
      final start = int.tryParse(startUpdate.text);
      final end = int.tryParse(endUpdate.text);

      if (start == null || end == null) return;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(nibutanProvider.notifier).state = AsyncData(
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

import 'package:flutter_nibutan_app/models/nibutan_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final nibutanProvider = StateNotifierProvider<NibutanController, NibutanState>(
  (ref) => NibutanController(),
);

class NibutanController extends StateNotifier<NibutanState> {
  NibutanController() : super(NibutanState());

  void update(int start, int end) {
    state = state.copyWith(start: start, end: end);
  }
}

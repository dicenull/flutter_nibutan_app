import 'dart:math';

import 'package:flutter_nibutan_app/models/nibutan_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final nibutanProvider =
    StateNotifierProvider<NibutanController, AsyncValue<NibutanState>>(
  (_) => NibutanController(),
);

class NibutanController extends StateNotifier<AsyncValue<NibutanState>> {
  var initState = NibutanState(start: 0, end: 0);

  NibutanController() : super(const AsyncLoading());
  void initialize(NibutanState data) {
    state = AsyncData(data);
    initState = data;
  }

  void processDown() {
    state.whenData((data) {
      state = AsyncData(data.copyWith(
        end: max(initState.start, data.middle - 1),
      ));
    });
  }

  void processUp() {
    state.whenData((data) {
      state = AsyncData(data.copyWith(
        start: min(initState.end, data.middle + 1),
      ));
    });
  }
}

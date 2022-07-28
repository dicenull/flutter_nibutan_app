import 'package:flutter_nibutan_app/models/nibutan_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final nibutanProvider = StateProvider<AsyncValue<NibutanState>>(
  (_) => const AsyncValue.loading(),
);

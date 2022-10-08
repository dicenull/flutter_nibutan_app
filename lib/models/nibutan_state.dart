import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'nibutan_state.freezed.dart';

@freezed
class NibutanState with _$NibutanState {
  late final valid = start < end;

  late final interval = end - start + 1;
  late final middle = ((end + start) / 2).round();
  late final progress =
      (interval > 0) ? (math.log(interval) / math.log(2)).floor() : 0;

  factory NibutanState({
    required int start,
    required int end,
  }) = _NibutanState;

  NibutanState._();
}

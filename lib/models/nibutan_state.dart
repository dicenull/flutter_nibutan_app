import 'package:freezed_annotation/freezed_annotation.dart';

part 'nibutan_state.freezed.dart';

@freezed
class NibutanState with _$NibutanState {
  late final valid = start <= end;

  factory NibutanState({
    required int start,
    required int end,
  }) = _NibutanState;
  NibutanState._();
}

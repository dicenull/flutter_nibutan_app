import 'package:freezed_annotation/freezed_annotation.dart';

part 'nibutan_state.freezed.dart';

@freezed
class NibutanState with _$NibutanState {
  NibutanState._();
  factory NibutanState({
    int? start,
    int? end,
  }) = _NibutanState;

  late final valid = (start != null && end != null) && start! <= end!;
}

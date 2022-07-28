import 'package:freezed_annotation/freezed_annotation.dart';

part 'nibutan_log.freezed.dart';

@freezed
class NibutanLog with _$NibutanLog {
  late final displayText = '${success ? '成功' : '失敗'}: $number';

  factory NibutanLog({
    required int number,
    required bool success,
  }) = _NibutanLog;

  NibutanLog._();
}

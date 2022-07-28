// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nibutan_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NibutanLog {
  int get number => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NibutanLogCopyWith<NibutanLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NibutanLogCopyWith<$Res> {
  factory $NibutanLogCopyWith(
          NibutanLog value, $Res Function(NibutanLog) then) =
      _$NibutanLogCopyWithImpl<$Res>;
  $Res call({int number, bool success});
}

/// @nodoc
class _$NibutanLogCopyWithImpl<$Res> implements $NibutanLogCopyWith<$Res> {
  _$NibutanLogCopyWithImpl(this._value, this._then);

  final NibutanLog _value;
  // ignore: unused_field
  final $Res Function(NibutanLog) _then;

  @override
  $Res call({
    Object? number = freezed,
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_NibutanLogCopyWith<$Res>
    implements $NibutanLogCopyWith<$Res> {
  factory _$$_NibutanLogCopyWith(
          _$_NibutanLog value, $Res Function(_$_NibutanLog) then) =
      __$$_NibutanLogCopyWithImpl<$Res>;
  @override
  $Res call({int number, bool success});
}

/// @nodoc
class __$$_NibutanLogCopyWithImpl<$Res> extends _$NibutanLogCopyWithImpl<$Res>
    implements _$$_NibutanLogCopyWith<$Res> {
  __$$_NibutanLogCopyWithImpl(
      _$_NibutanLog _value, $Res Function(_$_NibutanLog) _then)
      : super(_value, (v) => _then(v as _$_NibutanLog));

  @override
  _$_NibutanLog get _value => super._value as _$_NibutanLog;

  @override
  $Res call({
    Object? number = freezed,
    Object? success = freezed,
  }) {
    return _then(_$_NibutanLog(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NibutanLog extends _NibutanLog {
  _$_NibutanLog({required this.number, required this.success}) : super._();

  @override
  final int number;
  @override
  final bool success;

  @override
  String toString() {
    return 'NibutanLog(number: $number, success: $success)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NibutanLog &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.success, success));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(success));

  @JsonKey(ignore: true)
  @override
  _$$_NibutanLogCopyWith<_$_NibutanLog> get copyWith =>
      __$$_NibutanLogCopyWithImpl<_$_NibutanLog>(this, _$identity);
}

abstract class _NibutanLog extends NibutanLog {
  factory _NibutanLog(
      {required final int number, required final bool success}) = _$_NibutanLog;
  _NibutanLog._() : super._();

  @override
  int get number;
  @override
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$_NibutanLogCopyWith<_$_NibutanLog> get copyWith =>
      throw _privateConstructorUsedError;
}

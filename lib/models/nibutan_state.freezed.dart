// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nibutan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NibutanState {
  int? get start => throw _privateConstructorUsedError;
  int? get end => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NibutanStateCopyWith<NibutanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NibutanStateCopyWith<$Res> {
  factory $NibutanStateCopyWith(
          NibutanState value, $Res Function(NibutanState) then) =
      _$NibutanStateCopyWithImpl<$Res>;
  $Res call({int? start, int? end});
}

/// @nodoc
class _$NibutanStateCopyWithImpl<$Res> implements $NibutanStateCopyWith<$Res> {
  _$NibutanStateCopyWithImpl(this._value, this._then);

  final NibutanState _value;
  // ignore: unused_field
  final $Res Function(NibutanState) _then;

  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_value.copyWith(
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int?,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_NibutanStateCopyWith<$Res>
    implements $NibutanStateCopyWith<$Res> {
  factory _$$_NibutanStateCopyWith(
          _$_NibutanState value, $Res Function(_$_NibutanState) then) =
      __$$_NibutanStateCopyWithImpl<$Res>;
  @override
  $Res call({int? start, int? end});
}

/// @nodoc
class __$$_NibutanStateCopyWithImpl<$Res>
    extends _$NibutanStateCopyWithImpl<$Res>
    implements _$$_NibutanStateCopyWith<$Res> {
  __$$_NibutanStateCopyWithImpl(
      _$_NibutanState _value, $Res Function(_$_NibutanState) _then)
      : super(_value, (v) => _then(v as _$_NibutanState));

  @override
  _$_NibutanState get _value => super._value as _$_NibutanState;

  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_$_NibutanState(
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int?,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_NibutanState extends _NibutanState {
  _$_NibutanState({this.start, this.end}) : super._();

  @override
  final int? start;
  @override
  final int? end;

  @override
  String toString() {
    return 'NibutanState(start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NibutanState &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.end, end));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(end));

  @JsonKey(ignore: true)
  @override
  _$$_NibutanStateCopyWith<_$_NibutanState> get copyWith =>
      __$$_NibutanStateCopyWithImpl<_$_NibutanState>(this, _$identity);
}

abstract class _NibutanState extends NibutanState {
  factory _NibutanState({final int? start, final int? end}) = _$_NibutanState;
  _NibutanState._() : super._();

  @override
  int? get start;
  @override
  int? get end;
  @override
  @JsonKey(ignore: true)
  _$$_NibutanStateCopyWith<_$_NibutanState> get copyWith =>
      throw _privateConstructorUsedError;
}

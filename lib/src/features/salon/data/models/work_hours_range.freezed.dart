// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_hours_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkHoursRange _$WorkHoursRangeFromJson(Map<String, dynamic> json) {
  return _WorkHoursRange.fromJson(json);
}

/// @nodoc
mixin _$WorkHoursRange {
  @TimeOfDayConverter()
  TimeOfDay? get start => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkHoursRangeCopyWith<WorkHoursRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkHoursRangeCopyWith<$Res> {
  factory $WorkHoursRangeCopyWith(
          WorkHoursRange value, $Res Function(WorkHoursRange) then) =
      _$WorkHoursRangeCopyWithImpl<$Res, WorkHoursRange>;
  @useResult
  $Res call(
      {@TimeOfDayConverter() TimeOfDay? start,
      @TimeOfDayConverter() TimeOfDay? end});
}

/// @nodoc
class _$WorkHoursRangeCopyWithImpl<$Res, $Val extends WorkHoursRange>
    implements $WorkHoursRangeCopyWith<$Res> {
  _$WorkHoursRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_value.copyWith(
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkHoursRangeCopyWith<$Res>
    implements $WorkHoursRangeCopyWith<$Res> {
  factory _$$_WorkHoursRangeCopyWith(
          _$_WorkHoursRange value, $Res Function(_$_WorkHoursRange) then) =
      __$$_WorkHoursRangeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimeOfDayConverter() TimeOfDay? start,
      @TimeOfDayConverter() TimeOfDay? end});
}

/// @nodoc
class __$$_WorkHoursRangeCopyWithImpl<$Res>
    extends _$WorkHoursRangeCopyWithImpl<$Res, _$_WorkHoursRange>
    implements _$$_WorkHoursRangeCopyWith<$Res> {
  __$$_WorkHoursRangeCopyWithImpl(
      _$_WorkHoursRange _value, $Res Function(_$_WorkHoursRange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_$_WorkHoursRange(
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkHoursRange implements _WorkHoursRange {
  const _$_WorkHoursRange(
      {@TimeOfDayConverter() this.start, @TimeOfDayConverter() this.end});

  factory _$_WorkHoursRange.fromJson(Map<String, dynamic> json) =>
      _$$_WorkHoursRangeFromJson(json);

  @override
  @TimeOfDayConverter()
  final TimeOfDay? start;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? end;

  @override
  String toString() {
    return 'WorkHoursRange(start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkHoursRange &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkHoursRangeCopyWith<_$_WorkHoursRange> get copyWith =>
      __$$_WorkHoursRangeCopyWithImpl<_$_WorkHoursRange>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkHoursRangeToJson(
      this,
    );
  }
}

abstract class _WorkHoursRange implements WorkHoursRange {
  const factory _WorkHoursRange(
      {@TimeOfDayConverter() final TimeOfDay? start,
      @TimeOfDayConverter() final TimeOfDay? end}) = _$_WorkHoursRange;

  factory _WorkHoursRange.fromJson(Map<String, dynamic> json) =
      _$_WorkHoursRange.fromJson;

  @override
  @TimeOfDayConverter()
  TimeOfDay? get start;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get end;
  @override
  @JsonKey(ignore: true)
  _$$_WorkHoursRangeCopyWith<_$_WorkHoursRange> get copyWith =>
      throw _privateConstructorUsedError;
}

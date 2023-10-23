// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salon_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SalonSearchState {
  SearchStatus get status => throw _privateConstructorUsedError;
  List<Salon> get salons => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Set<String> get filterServices => throw _privateConstructorUsedError;
  double get filterMinRate => throw _privateConstructorUsedError;
  DayOfWeek? get filterWorkDay => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get filterStartTime => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get filterEndTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalonSearchStateCopyWith<SalonSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalonSearchStateCopyWith<$Res> {
  factory $SalonSearchStateCopyWith(
          SalonSearchState value, $Res Function(SalonSearchState) then) =
      _$SalonSearchStateCopyWithImpl<$Res, SalonSearchState>;
  @useResult
  $Res call(
      {SearchStatus status,
      List<Salon> salons,
      String message,
      Set<String> filterServices,
      double filterMinRate,
      DayOfWeek? filterWorkDay,
      @TimeOfDayConverter() TimeOfDay? filterStartTime,
      @TimeOfDayConverter() TimeOfDay? filterEndTime});
}

/// @nodoc
class _$SalonSearchStateCopyWithImpl<$Res, $Val extends SalonSearchState>
    implements $SalonSearchStateCopyWith<$Res> {
  _$SalonSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? salons = null,
    Object? message = null,
    Object? filterServices = null,
    Object? filterMinRate = null,
    Object? filterWorkDay = freezed,
    Object? filterStartTime = freezed,
    Object? filterEndTime = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SearchStatus,
      salons: null == salons
          ? _value.salons
          : salons // ignore: cast_nullable_to_non_nullable
              as List<Salon>,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      filterServices: null == filterServices
          ? _value.filterServices
          : filterServices // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      filterMinRate: null == filterMinRate
          ? _value.filterMinRate
          : filterMinRate // ignore: cast_nullable_to_non_nullable
              as double,
      filterWorkDay: freezed == filterWorkDay
          ? _value.filterWorkDay
          : filterWorkDay // ignore: cast_nullable_to_non_nullable
              as DayOfWeek?,
      filterStartTime: freezed == filterStartTime
          ? _value.filterStartTime
          : filterStartTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      filterEndTime: freezed == filterEndTime
          ? _value.filterEndTime
          : filterEndTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalonSearchStateCopyWith<$Res>
    implements $SalonSearchStateCopyWith<$Res> {
  factory _$$_SalonSearchStateCopyWith(
          _$_SalonSearchState value, $Res Function(_$_SalonSearchState) then) =
      __$$_SalonSearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SearchStatus status,
      List<Salon> salons,
      String message,
      Set<String> filterServices,
      double filterMinRate,
      DayOfWeek? filterWorkDay,
      @TimeOfDayConverter() TimeOfDay? filterStartTime,
      @TimeOfDayConverter() TimeOfDay? filterEndTime});
}

/// @nodoc
class __$$_SalonSearchStateCopyWithImpl<$Res>
    extends _$SalonSearchStateCopyWithImpl<$Res, _$_SalonSearchState>
    implements _$$_SalonSearchStateCopyWith<$Res> {
  __$$_SalonSearchStateCopyWithImpl(
      _$_SalonSearchState _value, $Res Function(_$_SalonSearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? salons = null,
    Object? message = null,
    Object? filterServices = null,
    Object? filterMinRate = null,
    Object? filterWorkDay = freezed,
    Object? filterStartTime = freezed,
    Object? filterEndTime = freezed,
  }) {
    return _then(_$_SalonSearchState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SearchStatus,
      salons: null == salons
          ? _value._salons
          : salons // ignore: cast_nullable_to_non_nullable
              as List<Salon>,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      filterServices: null == filterServices
          ? _value._filterServices
          : filterServices // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      filterMinRate: null == filterMinRate
          ? _value.filterMinRate
          : filterMinRate // ignore: cast_nullable_to_non_nullable
              as double,
      filterWorkDay: freezed == filterWorkDay
          ? _value.filterWorkDay
          : filterWorkDay // ignore: cast_nullable_to_non_nullable
              as DayOfWeek?,
      filterStartTime: freezed == filterStartTime
          ? _value.filterStartTime
          : filterStartTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      filterEndTime: freezed == filterEndTime
          ? _value.filterEndTime
          : filterEndTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
    ));
  }
}

/// @nodoc

class _$_SalonSearchState implements _SalonSearchState {
  const _$_SalonSearchState(
      {this.status = SearchStatus.initial,
      final List<Salon> salons = const [],
      this.message = "",
      final Set<String> filterServices = const {},
      this.filterMinRate = 0.0,
      this.filterWorkDay,
      @TimeOfDayConverter() this.filterStartTime,
      @TimeOfDayConverter() this.filterEndTime})
      : _salons = salons,
        _filterServices = filterServices;

  @override
  @JsonKey()
  final SearchStatus status;
  final List<Salon> _salons;
  @override
  @JsonKey()
  List<Salon> get salons {
    if (_salons is EqualUnmodifiableListView) return _salons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_salons);
  }

  @override
  @JsonKey()
  final String message;
  final Set<String> _filterServices;
  @override
  @JsonKey()
  Set<String> get filterServices {
    if (_filterServices is EqualUnmodifiableSetView) return _filterServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_filterServices);
  }

  @override
  @JsonKey()
  final double filterMinRate;
  @override
  final DayOfWeek? filterWorkDay;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? filterStartTime;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? filterEndTime;

  @override
  String toString() {
    return 'SalonSearchState(status: $status, salons: $salons, message: $message, filterServices: $filterServices, filterMinRate: $filterMinRate, filterWorkDay: $filterWorkDay, filterStartTime: $filterStartTime, filterEndTime: $filterEndTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalonSearchState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._salons, _salons) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._filterServices, _filterServices) &&
            (identical(other.filterMinRate, filterMinRate) ||
                other.filterMinRate == filterMinRate) &&
            (identical(other.filterWorkDay, filterWorkDay) ||
                other.filterWorkDay == filterWorkDay) &&
            (identical(other.filterStartTime, filterStartTime) ||
                other.filterStartTime == filterStartTime) &&
            (identical(other.filterEndTime, filterEndTime) ||
                other.filterEndTime == filterEndTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_salons),
      message,
      const DeepCollectionEquality().hash(_filterServices),
      filterMinRate,
      filterWorkDay,
      filterStartTime,
      filterEndTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalonSearchStateCopyWith<_$_SalonSearchState> get copyWith =>
      __$$_SalonSearchStateCopyWithImpl<_$_SalonSearchState>(this, _$identity);
}

abstract class _SalonSearchState implements SalonSearchState {
  const factory _SalonSearchState(
          {final SearchStatus status,
          final List<Salon> salons,
          final String message,
          final Set<String> filterServices,
          final double filterMinRate,
          final DayOfWeek? filterWorkDay,
          @TimeOfDayConverter() final TimeOfDay? filterStartTime,
          @TimeOfDayConverter() final TimeOfDay? filterEndTime}) =
      _$_SalonSearchState;

  @override
  SearchStatus get status;
  @override
  List<Salon> get salons;
  @override
  String get message;
  @override
  Set<String> get filterServices;
  @override
  double get filterMinRate;
  @override
  DayOfWeek? get filterWorkDay;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get filterStartTime;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get filterEndTime;
  @override
  @JsonKey(ignore: true)
  _$$_SalonSearchStateCopyWith<_$_SalonSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

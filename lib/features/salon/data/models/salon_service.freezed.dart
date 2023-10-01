// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salon_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalonService _$SalonServiceFromJson(Map<String, dynamic> json) {
  return _SalonService.fromJson(json);
}

/// @nodoc
mixin _$SalonService {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalonServiceCopyWith<SalonService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalonServiceCopyWith<$Res> {
  factory $SalonServiceCopyWith(
          SalonService value, $Res Function(SalonService) then) =
      _$SalonServiceCopyWithImpl<$Res, SalonService>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      Duration duration});
}

/// @nodoc
class _$SalonServiceCopyWithImpl<$Res, $Val extends SalonService>
    implements $SalonServiceCopyWith<$Res> {
  _$SalonServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalonServiceCopyWith<$Res>
    implements $SalonServiceCopyWith<$Res> {
  factory _$$_SalonServiceCopyWith(
          _$_SalonService value, $Res Function(_$_SalonService) then) =
      __$$_SalonServiceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      Duration duration});
}

/// @nodoc
class __$$_SalonServiceCopyWithImpl<$Res>
    extends _$SalonServiceCopyWithImpl<$Res, _$_SalonService>
    implements _$$_SalonServiceCopyWith<$Res> {
  __$$_SalonServiceCopyWithImpl(
      _$_SalonService _value, $Res Function(_$_SalonService) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? duration = null,
  }) {
    return _then(_$_SalonService(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SalonService implements _SalonService {
  const _$_SalonService(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.duration});

  factory _$_SalonService.fromJson(Map<String, dynamic> json) =>
      _$$_SalonServiceFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final double price;
  @override
  final Duration duration;

  @override
  String toString() {
    return 'SalonService(id: $id, name: $name, description: $description, price: $price, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalonService &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, price, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalonServiceCopyWith<_$_SalonService> get copyWith =>
      __$$_SalonServiceCopyWithImpl<_$_SalonService>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalonServiceToJson(
      this,
    );
  }
}

abstract class _SalonService implements SalonService {
  const factory _SalonService(
      {required final String id,
      required final String name,
      required final String description,
      required final double price,
      required final Duration duration}) = _$_SalonService;

  factory _SalonService.fromJson(Map<String, dynamic> json) =
      _$_SalonService.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  double get price;
  @override
  Duration get duration;
  @override
  @JsonKey(ignore: true)
  _$$_SalonServiceCopyWith<_$_SalonService> get copyWith =>
      throw _privateConstructorUsedError;
}

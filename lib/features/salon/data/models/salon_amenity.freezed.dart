// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salon_amenity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalonAmenity _$SalonAmenityFromJson(Map<String, dynamic> json) {
  return _SalonAmenity.fromJson(json);
}

/// @nodoc
mixin _$SalonAmenity {
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalonAmenityCopyWith<SalonAmenity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalonAmenityCopyWith<$Res> {
  factory $SalonAmenityCopyWith(
          SalonAmenity value, $Res Function(SalonAmenity) then) =
      _$SalonAmenityCopyWithImpl<$Res, SalonAmenity>;
  @useResult
  $Res call({String name, String icon});
}

/// @nodoc
class _$SalonAmenityCopyWithImpl<$Res, $Val extends SalonAmenity>
    implements $SalonAmenityCopyWith<$Res> {
  _$SalonAmenityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalonAmenityCopyWith<$Res>
    implements $SalonAmenityCopyWith<$Res> {
  factory _$$_SalonAmenityCopyWith(
          _$_SalonAmenity value, $Res Function(_$_SalonAmenity) then) =
      __$$_SalonAmenityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String icon});
}

/// @nodoc
class __$$_SalonAmenityCopyWithImpl<$Res>
    extends _$SalonAmenityCopyWithImpl<$Res, _$_SalonAmenity>
    implements _$$_SalonAmenityCopyWith<$Res> {
  __$$_SalonAmenityCopyWithImpl(
      _$_SalonAmenity _value, $Res Function(_$_SalonAmenity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
  }) {
    return _then(_$_SalonAmenity(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SalonAmenity implements _SalonAmenity {
  const _$_SalonAmenity({required this.name, required this.icon});

  factory _$_SalonAmenity.fromJson(Map<String, dynamic> json) =>
      _$$_SalonAmenityFromJson(json);

  @override
  final String name;
  @override
  final String icon;

  @override
  String toString() {
    return 'SalonAmenity(name: $name, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalonAmenity &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalonAmenityCopyWith<_$_SalonAmenity> get copyWith =>
      __$$_SalonAmenityCopyWithImpl<_$_SalonAmenity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalonAmenityToJson(
      this,
    );
  }
}

abstract class _SalonAmenity implements SalonAmenity {
  const factory _SalonAmenity(
      {required final String name,
      required final String icon}) = _$_SalonAmenity;

  factory _SalonAmenity.fromJson(Map<String, dynamic> json) =
      _$_SalonAmenity.fromJson;

  @override
  String get name;
  @override
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$_SalonAmenityCopyWith<_$_SalonAmenity> get copyWith =>
      throw _privateConstructorUsedError;
}

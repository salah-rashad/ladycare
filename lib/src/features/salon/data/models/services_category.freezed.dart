// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'services_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServicesCategory _$ServicesCategoryFromJson(Map<String, dynamic> json) {
  return _ServicesCategory.fromJson(json);
}

/// @nodoc
mixin _$ServicesCategory {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get iconUrl => throw _privateConstructorUsedError;
  int get salonId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServicesCategoryCopyWith<ServicesCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesCategoryCopyWith<$Res> {
  factory $ServicesCategoryCopyWith(
          ServicesCategory value, $Res Function(ServicesCategory) then) =
      _$ServicesCategoryCopyWithImpl<$Res, ServicesCategory>;
  @useResult
  $Res call({String id, String name, String iconUrl, int salonId});
}

/// @nodoc
class _$ServicesCategoryCopyWithImpl<$Res, $Val extends ServicesCategory>
    implements $ServicesCategoryCopyWith<$Res> {
  _$ServicesCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconUrl = null,
    Object? salonId = null,
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
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      salonId: null == salonId
          ? _value.salonId
          : salonId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServicesCategoryCopyWith<$Res>
    implements $ServicesCategoryCopyWith<$Res> {
  factory _$$_ServicesCategoryCopyWith(
          _$_ServicesCategory value, $Res Function(_$_ServicesCategory) then) =
      __$$_ServicesCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String iconUrl, int salonId});
}

/// @nodoc
class __$$_ServicesCategoryCopyWithImpl<$Res>
    extends _$ServicesCategoryCopyWithImpl<$Res, _$_ServicesCategory>
    implements _$$_ServicesCategoryCopyWith<$Res> {
  __$$_ServicesCategoryCopyWithImpl(
      _$_ServicesCategory _value, $Res Function(_$_ServicesCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconUrl = null,
    Object? salonId = null,
  }) {
    return _then(_$_ServicesCategory(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      salonId: null == salonId
          ? _value.salonId
          : salonId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServicesCategory implements _ServicesCategory {
  const _$_ServicesCategory(
      {required this.id,
      this.name = "",
      this.iconUrl = "",
      required this.salonId});

  factory _$_ServicesCategory.fromJson(Map<String, dynamic> json) =>
      _$$_ServicesCategoryFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String iconUrl;
  @override
  final int salonId;

  @override
  String toString() {
    return 'ServicesCategory(id: $id, name: $name, iconUrl: $iconUrl, salonId: $salonId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServicesCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.salonId, salonId) || other.salonId == salonId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, iconUrl, salonId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServicesCategoryCopyWith<_$_ServicesCategory> get copyWith =>
      __$$_ServicesCategoryCopyWithImpl<_$_ServicesCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServicesCategoryToJson(
      this,
    );
  }
}

abstract class _ServicesCategory implements ServicesCategory {
  const factory _ServicesCategory(
      {required final String id,
      final String name,
      final String iconUrl,
      required final int salonId}) = _$_ServicesCategory;

  factory _ServicesCategory.fromJson(Map<String, dynamic> json) =
      _$_ServicesCategory.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get iconUrl;
  @override
  int get salonId;
  @override
  @JsonKey(ignore: true)
  _$$_ServicesCategoryCopyWith<_$_ServicesCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

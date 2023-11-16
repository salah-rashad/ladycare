// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Salon _$SalonFromJson(Map<String, dynamic> json) {
  return _Salon.fromJson(json);
}

/// @nodoc
mixin _$Salon {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  @GeoPointConverter()
  GeoPoint? get location => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  List<SalonService> get services => throw _privateConstructorUsedError;
  List<SalonAmenity> get amenities => throw _privateConstructorUsedError;
  List<String> get branches => throw _privateConstructorUsedError;
  WorkDays? get workDays => throw _privateConstructorUsedError;
  double? get ratingAverage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalonCopyWith<Salon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalonCopyWith<$Res> {
  factory $SalonCopyWith(Salon value, $Res Function(Salon) then) =
      _$SalonCopyWithImpl<$Res, Salon>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String logo,
      @GeoPointConverter() GeoPoint? location,
      List<String> images,
      List<SalonService> services,
      List<SalonAmenity> amenities,
      List<String> branches,
      WorkDays? workDays,
      double? ratingAverage});

  $WorkDaysCopyWith<$Res>? get workDays;
}

/// @nodoc
class _$SalonCopyWithImpl<$Res, $Val extends Salon>
    implements $SalonCopyWith<$Res> {
  _$SalonCopyWithImpl(this._value, this._then);

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
    Object? logo = null,
    Object? location = freezed,
    Object? images = null,
    Object? services = null,
    Object? amenities = null,
    Object? branches = null,
    Object? workDays = freezed,
    Object? ratingAverage = freezed,
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
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<SalonService>,
      amenities: null == amenities
          ? _value.amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<SalonAmenity>,
      branches: null == branches
          ? _value.branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<String>,
      workDays: freezed == workDays
          ? _value.workDays
          : workDays // ignore: cast_nullable_to_non_nullable
              as WorkDays?,
      ratingAverage: freezed == ratingAverage
          ? _value.ratingAverage
          : ratingAverage // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkDaysCopyWith<$Res>? get workDays {
    if (_value.workDays == null) {
      return null;
    }

    return $WorkDaysCopyWith<$Res>(_value.workDays!, (value) {
      return _then(_value.copyWith(workDays: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SalonCopyWith<$Res> implements $SalonCopyWith<$Res> {
  factory _$$_SalonCopyWith(_$_Salon value, $Res Function(_$_Salon) then) =
      __$$_SalonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String logo,
      @GeoPointConverter() GeoPoint? location,
      List<String> images,
      List<SalonService> services,
      List<SalonAmenity> amenities,
      List<String> branches,
      WorkDays? workDays,
      double? ratingAverage});

  @override
  $WorkDaysCopyWith<$Res>? get workDays;
}

/// @nodoc
class __$$_SalonCopyWithImpl<$Res> extends _$SalonCopyWithImpl<$Res, _$_Salon>
    implements _$$_SalonCopyWith<$Res> {
  __$$_SalonCopyWithImpl(_$_Salon _value, $Res Function(_$_Salon) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? logo = null,
    Object? location = freezed,
    Object? images = null,
    Object? services = null,
    Object? amenities = null,
    Object? branches = null,
    Object? workDays = freezed,
    Object? ratingAverage = freezed,
  }) {
    return _then(_$_Salon(
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
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<SalonService>,
      amenities: null == amenities
          ? _value._amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<SalonAmenity>,
      branches: null == branches
          ? _value._branches
          : branches // ignore: cast_nullable_to_non_nullable
              as List<String>,
      workDays: freezed == workDays
          ? _value.workDays
          : workDays // ignore: cast_nullable_to_non_nullable
              as WorkDays?,
      ratingAverage: freezed == ratingAverage
          ? _value.ratingAverage
          : ratingAverage // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Salon implements _Salon {
  const _$_Salon(
      {required this.id,
      this.name = "",
      this.description = "",
      this.logo = "",
      @GeoPointConverter() this.location,
      final List<String> images = const [],
      final List<SalonService> services = const [],
      final List<SalonAmenity> amenities = const [],
      final List<String> branches = const [],
      this.workDays,
      this.ratingAverage})
      : _images = images,
        _services = services,
        _amenities = amenities,
        _branches = branches;

  factory _$_Salon.fromJson(Map<String, dynamic> json) =>
      _$$_SalonFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String logo;
  @override
  @GeoPointConverter()
  final GeoPoint? location;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<SalonService> _services;
  @override
  @JsonKey()
  List<SalonService> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  final List<SalonAmenity> _amenities;
  @override
  @JsonKey()
  List<SalonAmenity> get amenities {
    if (_amenities is EqualUnmodifiableListView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_amenities);
  }

  final List<String> _branches;
  @override
  @JsonKey()
  List<String> get branches {
    if (_branches is EqualUnmodifiableListView) return _branches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_branches);
  }

  @override
  final WorkDays? workDays;
  @override
  final double? ratingAverage;

  @override
  String toString() {
    return 'Salon(id: $id, name: $name, description: $description, logo: $logo, location: $location, images: $images, services: $services, amenities: $amenities, branches: $branches, workDays: $workDays, ratingAverage: $ratingAverage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Salon &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality()
                .equals(other._amenities, _amenities) &&
            const DeepCollectionEquality().equals(other._branches, _branches) &&
            (identical(other.workDays, workDays) ||
                other.workDays == workDays) &&
            (identical(other.ratingAverage, ratingAverage) ||
                other.ratingAverage == ratingAverage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      logo,
      location,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_services),
      const DeepCollectionEquality().hash(_amenities),
      const DeepCollectionEquality().hash(_branches),
      workDays,
      ratingAverage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalonCopyWith<_$_Salon> get copyWith =>
      __$$_SalonCopyWithImpl<_$_Salon>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalonToJson(
      this,
    );
  }
}

abstract class _Salon implements Salon {
  const factory _Salon(
      {required final String id,
      final String name,
      final String description,
      final String logo,
      @GeoPointConverter() final GeoPoint? location,
      final List<String> images,
      final List<SalonService> services,
      final List<SalonAmenity> amenities,
      final List<String> branches,
      final WorkDays? workDays,
      final double? ratingAverage}) = _$_Salon;

  factory _Salon.fromJson(Map<String, dynamic> json) = _$_Salon.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get logo;
  @override
  @GeoPointConverter()
  GeoPoint? get location;
  @override
  List<String> get images;
  @override
  List<SalonService> get services;
  @override
  List<SalonAmenity> get amenities;
  @override
  List<String> get branches;
  @override
  WorkDays? get workDays;
  @override
  double? get ratingAverage;
  @override
  @JsonKey(ignore: true)
  _$$_SalonCopyWith<_$_Salon> get copyWith =>
      throw _privateConstructorUsedError;
}

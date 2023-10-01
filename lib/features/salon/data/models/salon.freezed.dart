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
  String get profileImageUrl => throw _privateConstructorUsedError;
  List<String> get locations => throw _privateConstructorUsedError;
  List<String> get shots => throw _privateConstructorUsedError;
  WorkDays get workDays => throw _privateConstructorUsedError;
  double get ratingAverage => throw _privateConstructorUsedError;

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
      String profileImageUrl,
      List<String> locations,
      List<String> shots,
      WorkDays workDays,
      double ratingAverage});

  $WorkDaysCopyWith<$Res> get workDays;
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
    Object? profileImageUrl = null,
    Object? locations = null,
    Object? shots = null,
    Object? workDays = null,
    Object? ratingAverage = null,
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
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      locations: null == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shots: null == shots
          ? _value.shots
          : shots // ignore: cast_nullable_to_non_nullable
              as List<String>,
      workDays: null == workDays
          ? _value.workDays
          : workDays // ignore: cast_nullable_to_non_nullable
              as WorkDays,
      ratingAverage: null == ratingAverage
          ? _value.ratingAverage
          : ratingAverage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkDaysCopyWith<$Res> get workDays {
    return $WorkDaysCopyWith<$Res>(_value.workDays, (value) {
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
      String profileImageUrl,
      List<String> locations,
      List<String> shots,
      WorkDays workDays,
      double ratingAverage});

  @override
  $WorkDaysCopyWith<$Res> get workDays;
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
    Object? profileImageUrl = null,
    Object? locations = null,
    Object? shots = null,
    Object? workDays = null,
    Object? ratingAverage = null,
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
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      locations: null == locations
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shots: null == shots
          ? _value._shots
          : shots // ignore: cast_nullable_to_non_nullable
              as List<String>,
      workDays: null == workDays
          ? _value.workDays
          : workDays // ignore: cast_nullable_to_non_nullable
              as WorkDays,
      ratingAverage: null == ratingAverage
          ? _value.ratingAverage
          : ratingAverage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Salon implements _Salon {
  const _$_Salon(
      {required this.id,
      required this.name,
      required this.description,
      required this.profileImageUrl,
      required final List<String> locations,
      required final List<String> shots,
      required this.workDays,
      required this.ratingAverage})
      : _locations = locations,
        _shots = shots;

  factory _$_Salon.fromJson(Map<String, dynamic> json) =>
      _$$_SalonFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String profileImageUrl;
  final List<String> _locations;
  @override
  List<String> get locations {
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locations);
  }

  final List<String> _shots;
  @override
  List<String> get shots {
    if (_shots is EqualUnmodifiableListView) return _shots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shots);
  }

  @override
  final WorkDays workDays;
  @override
  final double ratingAverage;

  @override
  String toString() {
    return 'Salon(id: $id, name: $name, description: $description, profileImageUrl: $profileImageUrl, locations: $locations, shots: $shots, workDays: $workDays, ratingAverage: $ratingAverage)';
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
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            const DeepCollectionEquality()
                .equals(other._locations, _locations) &&
            const DeepCollectionEquality().equals(other._shots, _shots) &&
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
      profileImageUrl,
      const DeepCollectionEquality().hash(_locations),
      const DeepCollectionEquality().hash(_shots),
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
      required final String name,
      required final String description,
      required final String profileImageUrl,
      required final List<String> locations,
      required final List<String> shots,
      required final WorkDays workDays,
      required final double ratingAverage}) = _$_Salon;

  factory _Salon.fromJson(Map<String, dynamic> json) = _$_Salon.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get profileImageUrl;
  @override
  List<String> get locations;
  @override
  List<String> get shots;
  @override
  WorkDays get workDays;
  @override
  double get ratingAverage;
  @override
  @JsonKey(ignore: true)
  _$$_SalonCopyWith<_$_Salon> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerReview _$CustomerReviewFromJson(Map<String, dynamic> json) {
  return _CustomerReview.fromJson(json);
}

/// @nodoc
mixin _$CustomerReview {
  String get id => throw _privateConstructorUsedError;
  String get salonId => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerReviewCopyWith<CustomerReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerReviewCopyWith<$Res> {
  factory $CustomerReviewCopyWith(
          CustomerReview value, $Res Function(CustomerReview) then) =
      _$CustomerReviewCopyWithImpl<$Res, CustomerReview>;
  @useResult
  $Res call(
      {String id,
      String salonId,
      String customerId,
      double rating,
      String comment,
      DateTime createdAt});
}

/// @nodoc
class _$CustomerReviewCopyWithImpl<$Res, $Val extends CustomerReview>
    implements $CustomerReviewCopyWith<$Res> {
  _$CustomerReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? salonId = null,
    Object? customerId = null,
    Object? rating = null,
    Object? comment = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      salonId: null == salonId
          ? _value.salonId
          : salonId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerReviewCopyWith<$Res>
    implements $CustomerReviewCopyWith<$Res> {
  factory _$$_CustomerReviewCopyWith(
          _$_CustomerReview value, $Res Function(_$_CustomerReview) then) =
      __$$_CustomerReviewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String salonId,
      String customerId,
      double rating,
      String comment,
      DateTime createdAt});
}

/// @nodoc
class __$$_CustomerReviewCopyWithImpl<$Res>
    extends _$CustomerReviewCopyWithImpl<$Res, _$_CustomerReview>
    implements _$$_CustomerReviewCopyWith<$Res> {
  __$$_CustomerReviewCopyWithImpl(
      _$_CustomerReview _value, $Res Function(_$_CustomerReview) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? salonId = null,
    Object? customerId = null,
    Object? rating = null,
    Object? comment = null,
    Object? createdAt = null,
  }) {
    return _then(_$_CustomerReview(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      salonId: null == salonId
          ? _value.salonId
          : salonId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerReview implements _CustomerReview {
  const _$_CustomerReview(
      {required this.id,
      required this.salonId,
      required this.customerId,
      required this.rating,
      required this.comment,
      required this.createdAt});

  factory _$_CustomerReview.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerReviewFromJson(json);

  @override
  final String id;
  @override
  final String salonId;
  @override
  final String customerId;
  @override
  final double rating;
  @override
  final String comment;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'CustomerReview(id: $id, salonId: $salonId, customerId: $customerId, rating: $rating, comment: $comment, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerReview &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.salonId, salonId) || other.salonId == salonId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, salonId, customerId, rating, comment, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerReviewCopyWith<_$_CustomerReview> get copyWith =>
      __$$_CustomerReviewCopyWithImpl<_$_CustomerReview>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerReviewToJson(
      this,
    );
  }
}

abstract class _CustomerReview implements CustomerReview {
  const factory _CustomerReview(
      {required final String id,
      required final String salonId,
      required final String customerId,
      required final double rating,
      required final String comment,
      required final DateTime createdAt}) = _$_CustomerReview;

  factory _CustomerReview.fromJson(Map<String, dynamic> json) =
      _$_CustomerReview.fromJson;

  @override
  String get id;
  @override
  String get salonId;
  @override
  String get customerId;
  @override
  double get rating;
  @override
  String get comment;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerReviewCopyWith<_$_CustomerReview> get copyWith =>
      throw _privateConstructorUsedError;
}

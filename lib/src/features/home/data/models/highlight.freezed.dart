// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'highlight.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Highlight _$HighlightFromJson(Map<String, dynamic> json) {
  return _Highlight.fromJson(json);
}

/// @nodoc
mixin _$Highlight {
  String get label => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HighlightCopyWith<Highlight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HighlightCopyWith<$Res> {
  factory $HighlightCopyWith(Highlight value, $Res Function(Highlight) then) =
      _$HighlightCopyWithImpl<$Res, Highlight>;
  @useResult
  $Res call({String label, String imageUrl});
}

/// @nodoc
class _$HighlightCopyWithImpl<$Res, $Val extends Highlight>
    implements $HighlightCopyWith<$Res> {
  _$HighlightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HighlightCopyWith<$Res> implements $HighlightCopyWith<$Res> {
  factory _$$_HighlightCopyWith(
          _$_Highlight value, $Res Function(_$_Highlight) then) =
      __$$_HighlightCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String imageUrl});
}

/// @nodoc
class __$$_HighlightCopyWithImpl<$Res>
    extends _$HighlightCopyWithImpl<$Res, _$_Highlight>
    implements _$$_HighlightCopyWith<$Res> {
  __$$_HighlightCopyWithImpl(
      _$_Highlight _value, $Res Function(_$_Highlight) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? imageUrl = null,
  }) {
    return _then(_$_Highlight(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Highlight implements _Highlight {
  const _$_Highlight({required this.label, required this.imageUrl});

  factory _$_Highlight.fromJson(Map<String, dynamic> json) =>
      _$$_HighlightFromJson(json);

  @override
  final String label;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'Highlight(label: $label, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Highlight &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HighlightCopyWith<_$_Highlight> get copyWith =>
      __$$_HighlightCopyWithImpl<_$_Highlight>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HighlightToJson(
      this,
    );
  }
}

abstract class _Highlight implements Highlight {
  const factory _Highlight(
      {required final String label,
      required final String imageUrl}) = _$_Highlight;

  factory _Highlight.fromJson(Map<String, dynamic> json) =
      _$_Highlight.fromJson;

  @override
  String get label;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_HighlightCopyWith<_$_Highlight> get copyWith =>
      throw _privateConstructorUsedError;
}

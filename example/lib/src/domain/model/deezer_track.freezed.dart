// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deezer_track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeezerTrack _$DeezerTrackFromJson(Map<String, dynamic> json) {
  return _DeezerTrack.fromJson(json);
}

/// @nodoc
mixin _$DeezerTrack {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'preview')
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeezerTrackCopyWith<DeezerTrack> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeezerTrackCopyWith<$Res> {
  factory $DeezerTrackCopyWith(
          DeezerTrack value, $Res Function(DeezerTrack) then) =
      _$DeezerTrackCopyWithImpl<$Res, DeezerTrack>;
  @useResult
  $Res call({int id, String title, @JsonKey(name: 'preview') String url});
}

/// @nodoc
class _$DeezerTrackCopyWithImpl<$Res, $Val extends DeezerTrack>
    implements $DeezerTrackCopyWith<$Res> {
  _$DeezerTrackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeezerTrackCopyWith<$Res>
    implements $DeezerTrackCopyWith<$Res> {
  factory _$$_DeezerTrackCopyWith(
          _$_DeezerTrack value, $Res Function(_$_DeezerTrack) then) =
      __$$_DeezerTrackCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, @JsonKey(name: 'preview') String url});
}

/// @nodoc
class __$$_DeezerTrackCopyWithImpl<$Res>
    extends _$DeezerTrackCopyWithImpl<$Res, _$_DeezerTrack>
    implements _$$_DeezerTrackCopyWith<$Res> {
  __$$_DeezerTrackCopyWithImpl(
      _$_DeezerTrack _value, $Res Function(_$_DeezerTrack) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_$_DeezerTrack(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeezerTrack implements _DeezerTrack {
  const _$_DeezerTrack(
      {required this.id,
      required this.title,
      @JsonKey(name: 'preview') required this.url});

  factory _$_DeezerTrack.fromJson(Map<String, dynamic> json) =>
      _$$_DeezerTrackFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'preview')
  final String url;

  @override
  String toString() {
    return 'DeezerTrack(id: $id, title: $title, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeezerTrack &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeezerTrackCopyWith<_$_DeezerTrack> get copyWith =>
      __$$_DeezerTrackCopyWithImpl<_$_DeezerTrack>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeezerTrackToJson(
      this,
    );
  }
}

abstract class _DeezerTrack implements DeezerTrack {
  const factory _DeezerTrack(
      {required final int id,
      required final String title,
      @JsonKey(name: 'preview') required final String url}) = _$_DeezerTrack;

  factory _DeezerTrack.fromJson(Map<String, dynamic> json) =
      _$_DeezerTrack.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'preview')
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_DeezerTrackCopyWith<_$_DeezerTrack> get copyWith =>
      throw _privateConstructorUsedError;
}

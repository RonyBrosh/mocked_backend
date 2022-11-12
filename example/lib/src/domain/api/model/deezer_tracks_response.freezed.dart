// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'deezer_tracks_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeezerTracksResponse _$DeezerTracksResponseFromJson(Map<String, dynamic> json) {
  return _DeezerTracksResponse.fromJson(json);
}

/// @nodoc
mixin _$DeezerTracksResponse {
  List<DeezerTrack> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeezerTracksResponseCopyWith<DeezerTracksResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeezerTracksResponseCopyWith<$Res> {
  factory $DeezerTracksResponseCopyWith(DeezerTracksResponse value,
          $Res Function(DeezerTracksResponse) then) =
      _$DeezerTracksResponseCopyWithImpl<$Res, DeezerTracksResponse>;
  @useResult
  $Res call({List<DeezerTrack> data});
}

/// @nodoc
class _$DeezerTracksResponseCopyWithImpl<$Res,
        $Val extends DeezerTracksResponse>
    implements $DeezerTracksResponseCopyWith<$Res> {
  _$DeezerTracksResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DeezerTrack>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeezerTracksResponseCopyWith<$Res>
    implements $DeezerTracksResponseCopyWith<$Res> {
  factory _$$_DeezerTracksResponseCopyWith(_$_DeezerTracksResponse value,
          $Res Function(_$_DeezerTracksResponse) then) =
      __$$_DeezerTracksResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DeezerTrack> data});
}

/// @nodoc
class __$$_DeezerTracksResponseCopyWithImpl<$Res>
    extends _$DeezerTracksResponseCopyWithImpl<$Res, _$_DeezerTracksResponse>
    implements _$$_DeezerTracksResponseCopyWith<$Res> {
  __$$_DeezerTracksResponseCopyWithImpl(_$_DeezerTracksResponse _value,
      $Res Function(_$_DeezerTracksResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_DeezerTracksResponse(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DeezerTrack>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeezerTracksResponse implements _DeezerTracksResponse {
  const _$_DeezerTracksResponse(final List<DeezerTrack> data) : _data = data;

  factory _$_DeezerTracksResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DeezerTracksResponseFromJson(json);

  final List<DeezerTrack> _data;
  @override
  List<DeezerTrack> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'DeezerTracksResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeezerTracksResponse &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeezerTracksResponseCopyWith<_$_DeezerTracksResponse> get copyWith =>
      __$$_DeezerTracksResponseCopyWithImpl<_$_DeezerTracksResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeezerTracksResponseToJson(
      this,
    );
  }
}

abstract class _DeezerTracksResponse implements DeezerTracksResponse {
  const factory _DeezerTracksResponse(final List<DeezerTrack> data) =
      _$_DeezerTracksResponse;

  factory _DeezerTracksResponse.fromJson(Map<String, dynamic> json) =
      _$_DeezerTracksResponse.fromJson;

  @override
  List<DeezerTrack> get data;
  @override
  @JsonKey(ignore: true)
  _$$_DeezerTracksResponseCopyWith<_$_DeezerTracksResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

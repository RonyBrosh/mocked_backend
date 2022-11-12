// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deezer_tracks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeezerTracksResponse _$$_DeezerTracksResponseFromJson(
        Map<String, dynamic> json) =>
    _$_DeezerTracksResponse(
      (json['data'] as List<dynamic>)
          .map((e) => DeezerTrack.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DeezerTracksResponseToJson(
        _$_DeezerTracksResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

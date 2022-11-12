import 'package:freezed_annotation/freezed_annotation.dart';

part 'deezer_track.freezed.dart';
part 'deezer_track.g.dart';

@freezed
class DeezerTrack with _$DeezerTrack {
  const factory DeezerTrack({
    required int id,
    required String title,
    @JsonKey(name: 'preview') required String url,
  }) = _DeezerTrack;

  factory DeezerTrack.fromJson(Map<String, dynamic> json) =>
      _$DeezerTrackFromJson(json);
}

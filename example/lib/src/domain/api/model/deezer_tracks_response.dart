import 'package:example/src/domain/model/deezer_track.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deezer_tracks_response.freezed.dart';
part 'deezer_tracks_response.g.dart';

@freezed
class DeezerTracksResponse with _$DeezerTracksResponse {
  const factory DeezerTracksResponse(List<DeezerTrack> data) =
      _DeezerTracksResponse;

  factory DeezerTracksResponse.fromJson(Map<String, dynamic> json) =>
      _$DeezerTracksResponseFromJson(json);
}

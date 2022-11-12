import 'package:example/src/domain/api/deezer_api.dart';
import 'package:example/src/domain/model/deezer_track.dart';

class DeezerRepository {
  const DeezerRepository(this._deezerApi);

  final DeezerApi _deezerApi;

  Future<List<DeezerTrack>> getTracksForArtist(String artist) async {
    try {
      final result = await _deezerApi.getTracksForArtist(artist);
      return result.data;
    } catch (_) {
      return [];
    }
  }
}

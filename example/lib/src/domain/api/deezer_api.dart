import 'package:dio/dio.dart';
import 'package:example/src/domain/api/model/deezer_tracks_response.dart';
import 'package:retrofit/retrofit.dart';

part 'deezer_api.g.dart';

@RestApi()
abstract class DeezerApi {
  factory DeezerApi(Dio dio) = _DeezerApi;

  @GET('/app/tracks?limit=5')
  Future<DeezerTracksResponse> getTracksForArtist(
      @Query('artist') String artist);
}

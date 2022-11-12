import 'package:dio/dio.dart';
import 'package:example/src/domain/api/deezer_api.dart';
import 'package:example/src/domain/model/deezer_track.dart';
import 'package:example/src/domain/repository/deezer_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocked_backend/mocked_backend.dart';

import 'test_response.dart';

void main() {
  const artist = 'Mastodon';

  late MockedBackendInterceptor mockedBackendInterceptor;
  late DeezerRepository sut;

  setUp(() {
    mockedBackendInterceptor = MockedBackendInterceptor();
    final dio = Dio(BaseOptions(baseUrl: 'https://api.deezer.com'));
    dio.interceptors.add(mockedBackendInterceptor);
    sut = DeezerRepository(DeezerApi(dio));
  });

  test('getTracksForArtist SHOULD return a list of tracks WHEN api succeeds',
      () async {
    const expected = [
      DeezerTrack(
        id: 10969975,
        title: 'Blood and Thunder',
        url:
            'https://cdns-preview-8.dzcdn.net/stream/c-8c4d8d6a4404763ecd127eaac8fb819a-6.mp3',
      ),
      DeezerTrack(
        id: 1517036362,
        title: 'Pain with an Anchor',
        url:
            'https://cdns-preview-2.dzcdn.net/stream/c-21244ab47fd8720c2aa6567cf195f6c8-3.mp3',
      ),
      DeezerTrack(
        id: 1517036392,
        title: 'More Than I Could Chew',
        url:
            'https://cdns-preview-2.dzcdn.net/stream/c-2c7c46e45d02b27fa4bbed628848ff7c-3.mp3',
      ),
    ];
    final scenario = Scenario([
      MockedRequestHandler(
        requestMatcher: RequestMatcherFactory.multiple([
          RequestMatcherFactory.method('GET'),
          RequestMatcherFactory.path('/app/tracks'),
          RequestMatcherFactory.query({'artist': artist}),
        ]),
        isSuccess: true,
        body: deezerSuccessResponseJson,
      ),
    ]);
    mockedBackendInterceptor.mockScenario(scenario);

    final result = await sut.getTracksForArtist(artist);

    expect(result, expected);
  });

  test('getTracksForArtist SHOULD return an empty list WHEN api fails',
      () async {
    final scenario = Scenario([
      MockedRequestHandler(
        requestMatcher: RequestMatcherFactory.multiple([
          RequestMatcherFactory.path('/app/tracks'),
          RequestMatcherFactory.query({'artist': artist}),
        ]),
        isSuccess: false,
        statusCode: 400,
      ),
    ]);
    mockedBackendInterceptor.mockScenario(scenario);

    final result = await sut.getTracksForArtist(artist);

    expect(result, []);
  });
}

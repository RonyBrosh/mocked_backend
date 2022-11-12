import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocked_backend/src/mocked_backend_interceptor.dart';
import 'package:mocked_backend/src/model/mocked_request_handler.dart';
import 'package:mocked_backend/src/model/request_matcher.dart';
import 'package:mocked_backend/src/model/request_not_mocked_exception.dart';
import 'package:mocked_backend/src/model/scenario.dart';

void main() {
  const path = 'https://en.wikipedia.org/wiki/Camel_(band)?genre=progressive';
  const body = '{"key":"value"}';
  const statusCode = 666;
  final testShouldFailException = Exception('Test should fail');
  final queryParameters = {"Bass": "Fender", "name": "Doug Ferguson"};

  late Dio dio;
  late MockedBackendInterceptor sut;

  setUp(() {
    sut = MockedBackendInterceptor();

    dio = Dio();
    dio.interceptors.add(sut);
  });

  test(
      'sut SHOULD throw a RequestNotMockedException WHEN request is not mocked',
      () async {
    try {
      await dio.get(path);
      throw testShouldFailException;
    } catch (exception) {
      final expected =
          (exception as DioError).error as RequestNotMockedException;
      expect(
        expected.toString(),
        '''
REQUEST NOT MOCKED EXCEPTION
Method: GET
Path: $path
Body: {}
''',
      );
    }
  });

  test('sut SHOULD throw a RequestNotMockedException WHEN method is not mocked',
      () async {
    try {
      sut.mockScenario(Scenario([
        MockedRequestHandler(
          requestMatcher: RequestMatcherFactory.multiple([
            RequestMatcherFactory.path(path),
            RequestMatcherFactory.method('POST'),
            RequestMatcherFactory.body(body),
          ]),
          isSuccess: true,
          body: body,
          statusCode: statusCode,
        ),
      ]));
      await dio.get(path);
      throw testShouldFailException;
    } catch (exception) {
      expect(
        (exception as DioError).error.runtimeType,
        RequestNotMockedException,
      );
    }
  });

  test('sut SHOULD throw a RequestNotMockedException WHEN body is not mocked',
      () async {
    try {
      sut.mockScenario(Scenario([
        MockedRequestHandler(
          requestMatcher: RequestMatcherFactory.body(body),
          isSuccess: true,
          body: body,
          statusCode: statusCode,
        ),
      ]));
      await dio.get(path, options: Options(extra: jsonDecode(body)));
      throw testShouldFailException;
    } catch (exception) {
      expect(
        (exception as DioError).error.runtimeType,
        RequestNotMockedException,
      );
    }
  });

  test('sut SHOULD throw a RequestNotMockedException WHEN query is not mocked',
      () async {
    try {
      sut.mockScenario(Scenario([
        MockedRequestHandler(
          requestMatcher: RequestMatcherFactory.query(queryParameters),
          isSuccess: true,
        ),
      ]));
      await dio.get(path);
      throw testShouldFailException;
    } catch (exception) {
      expect(
        (exception as DioError).error.runtimeType,
        RequestNotMockedException,
      );
    }
  });

  test('sut SHOULD return mocked response WHEN request is not success',
      () async {
    sut.mockScenario(Scenario([
      MockedRequestHandler(
        requestMatcher: RequestMatcherFactory.path(path),
        isSuccess: false,
        body: body,
        statusCode: statusCode,
      ),
    ]));
    try {
      await dio.get(path);
    } catch (exception) {
      final dioError = (exception as DioError);
      expect(dioError.response!.data, jsonDecode(body));
      expect(dioError.response!.statusCode, statusCode);
    }
  });

  test('sut SHOULD return mocked response WHEN request is success', () async {
    sut.mockScenario(Scenario([
      MockedRequestHandler(
        requestMatcher: RequestMatcherFactory.path(
            'https://en.wikipedia.org/wiki/Andy_Ward_(musician)'),
        isSuccess: true,
      ),
      MockedRequestHandler(
        requestMatcher: RequestMatcherFactory.multiple([
          RequestMatcherFactory.path(path),
          RequestMatcherFactory.method('POST'),
          RequestMatcherFactory.body(body),
          RequestMatcherFactory.query(queryParameters),
        ]),
        isSuccess: true,
        body: body,
        statusCode: statusCode,
      ),
    ]));
    await dio.get('https://en.wikipedia.org/wiki/Andy_Ward_(musician)');
    final response = await dio.post(
      path,
      data: jsonDecode(body),
      queryParameters: queryParameters,
    );
    expect(response.data, jsonDecode(body));
    expect(response.statusCode, statusCode);
  });
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mocked_backend/src/model/request_not_mocked_exception.dart';
import 'package:mocked_backend/src/model/scenario.dart';
import 'package:mocked_backend/src/requests_manager.dart';

class MockedBackendInterceptor extends Interceptor {
  final _requestsManager = RequestsManager();

  void mockScenario(Scenario scenario) =>
      _requestsManager.setRequests(scenario.requests);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestHandler = _requestsManager.handle(options);
    if (requestHandler == null) {
      final exception = RequestNotMockedException(options);
      if (kDebugMode) {
        print(exception);
      }
      throw exception;
    }

    final body = requestHandler.body;
    final response = Response(
      requestOptions: options,
      data: body != null ? jsonDecode(body) : null,
      statusCode: requestHandler.statusCode,
    );

    requestHandler.isSuccess
        ? handler.resolve(response)
        : handler.reject(DioError(requestOptions: options, response: response));
  }
}

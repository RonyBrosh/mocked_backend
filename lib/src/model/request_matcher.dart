import 'dart:convert';

import 'package:dio/dio.dart';

typedef RequestMatcher = bool Function(RequestOptions);

abstract class RequestMatcherFactory {
  static RequestMatcher path(String path) =>
      (requestOptions) => requestOptions.path.contains(path);

  static RequestMatcher method(String method) => (requestOptions) =>
      requestOptions.method.toUpperCase() == method.toUpperCase();

  static RequestMatcher body(String body) =>
      (request) => request.data.toString() == jsonDecode(body).toString();

  static RequestMatcher query(
    Map<String, String> queryParameters, [
    isExactMatch = false,
  ]) =>
      (requestOptions) {
        return queryParameters.keys.fold(
          true,
          (previousValue, key) =>
              previousValue &&
              requestOptions.queryParameters[key] == queryParameters[key],
        );
      };

  static RequestMatcher multiple(List<RequestMatcher> matchers) =>
      (requestOptions) => matchers.fold(
            true,
            (previousValue, matcher) =>
                previousValue && matcher(requestOptions),
          );
}

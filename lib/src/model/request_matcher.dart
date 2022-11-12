import 'dart:convert';

import 'package:dio/dio.dart';

typedef RequestMatcher = bool Function(RequestOptions);

abstract class RequestMatcherFactory {
  static RequestMatcher path(String path) =>
      (requestOptions) => requestOptions.path == path;

  static RequestMatcher method(String method) => (requestOptions) =>
      requestOptions.method.toUpperCase() == method.toUpperCase();

  static RequestMatcher body(String body) =>
      (request) => request.data.toString() == jsonDecode(body).toString();

  static RequestMatcher query(
    Map<String, String> queryParameters, [
    isExactMatch = false,
  ]) =>
      (requestOptions) {
        if (isExactMatch) {
          return requestOptions.queryParameters.toString() ==
              queryParameters.toString();
        } else {
          return requestOptions.queryParameters
              .toString()
              .contains(queryParameters.toString());
        }
      };

  static RequestMatcher multiple(List<RequestMatcher> matchers) =>
      (requestOptions) => matchers.fold(
            true,
            (previousValue, matcher) =>
                previousValue && matcher(requestOptions),
          );
}

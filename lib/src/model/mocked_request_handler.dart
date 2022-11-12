import 'package:mocked_backend/src/model/request_matcher.dart';

class MockedRequestHandler {
  const MockedRequestHandler({
    required this.requestMatcher,
    required this.isSuccess,
    this.body,
    this.statusCode,
  });

  final RequestMatcher requestMatcher;
  final bool isSuccess;
  final String? body;
  final int? statusCode;
}

import 'package:dio/dio.dart';
import 'package:mocked_backend/src/model/mocked_request_handler.dart';

class RequestsManager {
  RequestsManager();

  final List<MockedRequestHandler> _requests = List.empty(growable: true);

  void setRequests(List<MockedRequestHandler> requests) {
    _requests.clear();
    _requests.addAll(requests);
  }

  MockedRequestHandler? handle(RequestOptions options) {
    for (var mockedRequest in _requests) {
      if (mockedRequest.requestMatcher(options)) {
        return mockedRequest;
      }
    }
    return null;
  }
}

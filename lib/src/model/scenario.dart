import 'package:mocked_backend/src/model/mocked_request_handler.dart';

class Scenario {
  Scenario(this.requests);

  List<MockedRequestHandler> requests;
}

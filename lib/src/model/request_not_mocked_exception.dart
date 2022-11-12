import 'package:dio/dio.dart';

class RequestNotMockedException implements Exception {
  const RequestNotMockedException(this.requestOptions);

  final RequestOptions requestOptions;

  @override
  String toString() => '''
REQUEST NOT MOCKED EXCEPTION
Method: ${requestOptions.method}
Path: ${requestOptions.path}
Body: ${requestOptions.extra}
''';
}

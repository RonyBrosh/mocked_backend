class MockedErrorResponse {
  const MockedErrorResponse({
    required this.errorCode,
    this.body,
  });

  final int errorCode;
  final String? body;

  @override
  String toString() {
    return 'MockedErrorResponse: [$errorCode] $body';
  }
}

[![Coverage Status](https://coveralls.io/repos/github/RonyBrosh/mocked_backend/badge.svg)](https://coveralls.io/github/RonyBrosh/mocked_backend)

A testing library for [Dio](https://pub.dev/packages/dio) based projects.  

If you're using Dio directly or [Rertofit](https://pub.dev/packages/retrofit) for networking, You can validate your backend integration by mocking Json responses and errors. 

## Features
* Easily mock a backend response
* Confirm your endpoint's implementation integrity by using request matchers
* Chain multiple request into a "Scenario"

## Getting started
### Add the dependency
```yaml
dev_dependencies:
  mocked_backend: <latest version>
```
The latest version can be found in the [Versions](https://pub.dev/packages/mocked_backend/versions) tab on pub.dev
* Make sure it's added as a **dev_dependencies**

### Setup a Dio interceptor
Create an instance of **MockedBackendInterceptor** and add it to Dio's interceptors: 
```dart
mockedBackendInterceptor = MockedBackendInterceptor();
final dio = Dio(BaseOptions(baseUrl: 'https://api.deezer.com'));
dio.interceptors.add(mockedBackendInterceptor);
```
* For unit tests, keep a reference for the above interceptor to use it in your tests later
* For BDD tests, you can register the interceptor in your DI of choise and then simply "get_it" when needed

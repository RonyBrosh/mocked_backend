[![Coverage Status](https://coveralls.io/repos/github/RonyBrosh/mocked_backend/badge.svg)](https://coveralls.io/github/RonyBrosh/mocked_backend)

A testing library for [Dio](https://pub.dev/packages/dio) based projects.  

When working on a feature that requires networking it's best to confirm that the feature behaves as expected before going to production.
This means testing for happy paths, unhappy paths, and for the relevant endpoint(s) integrity i.e we pass the correct query parameters, json body, headers, etc..

If you use Dio directly or [Rertofit](https://pub.dev/packages/retrofit) for networking, Use this library to validate your backend integration by mocking Json responses and errors. 

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

### Mocking an endpoint
To mock an endpoint create a **MockedRequestHandler**:
```dart
MockedRequestHandler(
  requestMatcher: RequestMatcherFactory.path('Your endpoint's path'),
  isSuccess: true,
)
```

Two parameters are required to create a **MockedRequestHandler**:
1. **requestMatcher** - Tells the interceptor how to detect the desired endpoint
2. **isSuccess** - Tells the interceptor how to treat the matched endpoint. Either success or error (boolean)

There are optional parameters that can be used as well:
1. **body** - Can be used as the json response that the backebd should return (both for success or error response)
2. **statusCode** - Can be used if you want to map an error code to a custom exception. It can also be used for a successful response such as 201 if your business logic requires it

#### Requests matchers
There are multiple requestMatcher that you can use to match an endpoint:
1. RequestMatcherFactory.**path**(String path) - Will match a request if its path **contains** the given path
2. RequestMatcherFactory.**method**(String method) - Will match a request based on its methos (get, post, put, etc..). It's best to use it in combination with at least the path matcher. Otherwise the first endpoint that has the same method will be matched and probably will fail the test
3. RequestMatcherFactory.**body**(String body) - Will match a request that has the given body
4. RequestMatcherFactory.**query**(Map<String, String> queryParameters) - Will match a request that **contains** the given queryParameters
5. RequestMatcherFactory.**multiple**(List<RequestMatcher> matchers) - Let you mix and match the above matchers. Perfect for cases when multiple endpoints have the same path and differ by their method:
  ```dart
  /// Get a list of tracks:
  RequestMatcherFactory.multiple([
    RequestMatcherFactory.method('GET'),
    RequestMatcherFactory.path('/app/tracks'),
  ])
  /// vs update a list of tracks:
  RequestMatcherFactory.multiple([
    RequestMatcherFactory.method('PUT'),
    RequestMatcherFactory.path('/app/tracks'),
  ])
  ```
  
The best way to confirm your implementation is to combine all of the above matchers. This way you confirm that you use the correct endpoint's method, path, query parameters, json body, and soon there wiill be another matcher to match the request's headers.

* It might look like a bit of work but it will prevent bugs if for example, the API contract has been changed and a query parameter's key is now different
  
The next step is to wrap the **MockedRequestHandler** in a **Scenario**. A scenario is a class that holds a list of **MockedRequestHandler**s.
  
If your business logic requires calling multiple endpoints, for example, a login form might need to call one endpoint to validates a given email and another endpoint to sends an email:
```dart
  final sendEmailSucceedsScenario = Scenario([
    MockedRequestHandler(
        requestMatcher: RequestMatcherFactory.path('/email/evaluate'),
        isSuccess: true,
    ),
    MockedRequestHandler(
      requestMatcher: RequestMatcherFactory.path('/email/send'),
      isSuccess: true,
    ),
  ]);
```
Those two different endpoints can be easily incoporated in a single scenario.
  
The last step is to pass the scenario to the **MockedBackendInterceptor**:
```dart
mockedBackendInterceptor.mockScenario(sendEmailSucceedsScenario);
```
  
* Please note, If your test calls an endpoint that isn't mocked, a RequestNotMockedException will be thrown:
  ```dart
  REQUEST NOT MOCKED EXCEPTION
  Method: GET
  Path: /app/tracks?limit=5
  Body: {}
  ```
  
That's it! If you run a test and a triggered endpoint is matched then you'll get the expected mocked response.
  
## Example app
If you want to see more examples, checkout the [example](https://github.com/RonyBrosh/mocked_backend/tree/main/example) in the Github repository.



import 'dart:async';

import 'package:auth_plugin/auth_service.dart';
import 'package:chopper/chopper.dart';

class AuthClientBuilder {
  static ChopperClient buildChopperClient(
          List<ChopperService> services, String baseUrl) =>
      ChopperClient(
          converter: FormUrlEncodedConverter(),
          interceptors: [
        AuthInterceptor(),
        HttpLoggingInterceptor(),
        CurlInterceptor(),
      ], baseUrl: baseUrl, services: services);

  static ChopperClient buildChopperClientSimple(String baseUrl) =>
      buildChopperClient([AuthService.create()], baseUrl);
}

class AuthInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    //final params = Map<String, dynamic>.from(req.parameters);
    final headers = Map<String, String>.from(request.headers);
    //headers['Content-Type'] = 'application/json';
    headers['Accept'] = '*/*';
    headers['Authorization'] =
        'Basic c2RrLW1vYmlsZToxZjFiNWEwZC0yNDQ2LTRiOTktOGY2My1lMzZjNDdlNDliZWE=';
    headers['Content-Type'] = 'application/x-www-form-urlencoded';
    //headers['sdk-mobile'] = '1f1b5a0d-2446-4b99-8f63-e36c47e49bea';
    //headers['accept'] = 'application/json';
    //headers['Authorization'] = 'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjBTdm9fOHBHdzlsQTJDaXVMTzdlbiJ9.eyJodHRwOi8vZmFjZXBoaS5jb20vaWRlbnRpdHkvY2xhaW1zL3JvbGUiOlsidXNlciJdLCJodHRwOi8vZmFjZXBoaS5jb20vaWRlbnRpdHkvY2xhaW1zL2VtYWlsIjoianBvdmVkYUBmYWNlcGhpLmNvbSIsImh0dHA6Ly9mYWNlcGhpLmNvbS9pZGVudGl0eS9jbGFpbXMvdGVuYW50IjpbInRlbmFudC0xIl0sImh0dHA6Ly9mYWNlcGhpLmNvbS9pZGVudGl0eS9jbGFpbXMvZW5hYmxlX3ZpZGVvIjpmYWxzZSwiaXNzIjoiaHR0cHM6Ly9kZXYtZTQtdGl0ZGsuZXUuYXV0aDAuY29tLyIsInN1YiI6ImF1dGgwfDYwNTFlMzI0Y2U1MTk3MDA2ODlkOWI3NyIsImF1ZCI6Imh0dHBzOi8vYXV0aC5zZWxwaGktZGVtby1mYWNlcGhpLmNvbSIsImlhdCI6MTYzNDI4NjM1NiwiZXhwIjoxNjM0Mjg3MjU2LCJhenAiOiJtRTJ4U1JIaDI4aFNrSDdPZUNVSmRHMWVlN2VaM0JqOCIsInNjb3BlIjoib2ZmbGluZV9hY2Nlc3MiLCJndHkiOiJwYXNzd29yZCIsInBlcm1pc3Npb25zIjpbXX0.DEJh5Nq1GSiGgHRVic76kLn_tqydQgUyQ-X_kcHaOtouzZpxzsAJCDx_e5fKnKja72Z75z5WMjrqQLg-70HC1WX06theb1LTrhwHYYoLbjssCYF8gj_zjEhCgj8efK_HAVVnxUrRfT4P4KiCYcBJwKYF_dZ3y39vzw3VMoj-mbZcjfGDbHPk0zVlWyfHbUXw6nyXiXsMhSFl7r8fFtUxFskb_hFjVNE-cFUj6BEeve24ThAuUnVElexpmr7_GbXXShHSagchfvFxdUCFxs0GYoe4OMIxTMvSUA7b2DKLjlYCP5QLor7cmUXveFtbiHEw8iHVZULLDhG2N1M1uP6CUQ';
    return request.copyWith(headers: headers);
  }
}

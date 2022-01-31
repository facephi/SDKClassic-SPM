import 'dart:async';
import 'dart:convert';

import 'package:auth_plugin/auth_service.dart';
import 'package:chopper/chopper.dart';

class AuthClientBuilder {
  static ChopperClient buildChopperClient(
          List<ChopperService> services, String baseUrl, String authClient) =>
      ChopperClient(
          converter: FormUrlEncodedConverter(),
          interceptors: [
        AuthInterceptor(authClient),
        HttpLoggingInterceptor(),
        CurlInterceptor(),
      ], baseUrl: baseUrl, services: services);

  static ChopperClient buildChopperClientSimple(String baseUrl, String authClient) =>
      buildChopperClient([AuthService.create()], baseUrl, authClient);
}

class AuthInterceptor implements RequestInterceptor {
  String authClient;

  AuthInterceptor(this.authClient);

  @override
  FutureOr<Request> onRequest(Request request) async {
    final headers = Map<String, String>.from(request.headers);
    headers['Accept'] = '*/*';
    headers['Content-Type'] = 'application/x-www-form-urlencoded';
    headers['scope'] = 'openid';
    headers['grant_type'] = 'client_credentials';
    headers['Authorization'] = 'Basic ' + base64Encode(utf8.encode(authClient));
    return request.copyWith(headers: headers);
  }
}

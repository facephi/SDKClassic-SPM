import 'dart:async';
import 'dart:convert';

import 'package:flutter_module/environment.dart';
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
    final headers = Map<String, String>.from(request.headers);
    headers['Accept'] = '*/*';
    headers['Content-Type'] = 'application/x-www-form-urlencoded';
    headers['scope'] = 'openid';
    headers['grant_type'] = 'client_credentials';
    headers['Authorization'] = 'Basic ' + base64Encode(utf8.encode(Environment.getAuthClient()));
    return request.copyWith(headers: headers);
  }
}

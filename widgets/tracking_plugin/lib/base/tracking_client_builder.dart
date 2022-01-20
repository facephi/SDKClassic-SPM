import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:tracking_plugin/tracking_service.dart';

class TrackingClientBuilder {
  static ChopperClient buildChopperClient(List<ChopperService> services,
      String baseUrl, String authToken) =>
      ChopperClient(
          interceptors: [
            AuthTokenInterceptor(authToken),
            HttpLoggingInterceptor(),
            CurlInterceptor(),
          ],
          baseUrl: baseUrl,
          services: services);

  static ChopperClient buildChopperClientSimple(String baseUrl,
      String authToken) =>
      buildChopperClient([TrackingService.create()], baseUrl, authToken);
}

class AuthTokenInterceptor implements RequestInterceptor {
  AuthTokenInterceptor(this.authToken);

  String authToken;

  @override
  FutureOr<Request> onRequest(Request request) async {
    final headers = Map<String, String>.from(request.headers);
    headers['Content-Type'] = 'application/json';
    headers['Authorization'] = "Bearer " + authToken;
    return request.copyWith(headers: headers);
  }
}
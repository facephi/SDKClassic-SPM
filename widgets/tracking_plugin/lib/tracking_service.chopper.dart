// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$TrackingService extends TrackingService {
  _$TrackingService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TrackingService;

  @override
  Future<Response<String>> postEvent(String event) {
    final $url = 'tracking/events';
    final $body = event;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<String, String>($request);
  }
}

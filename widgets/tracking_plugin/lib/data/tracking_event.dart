// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'tracking_event.g.dart';

@JsonSerializable()
class TrackingEvent {
  TrackingEvent({
    required this.family,
    required this.sessionId,
    required this.operationId,
    required this.events,
    this.tenantId = "e9b039fa-0a2f-4149-9acc-a7e20a46464e",
    this.version = 1,
    this.source = 'sdk.mobile',
  });

  final int version;
  final String tenantId;
  final String source;
  final String family;
  final String sessionId;
  final String operationId;
  final List<Event> events;

  factory TrackingEvent.fromJson(Map<String, dynamic> json) =>
      _$TrackingEventFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingEventToJson(this);
}

@JsonSerializable()
class Event {
  Event({
    required this.eventId,
    required this.payload,
    required this.clientTimestamp,
  });

  final String eventId;
  final Payload payload;
  final String clientTimestamp;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable()
class Payload {
  Payload({
    this.type,
    this.screen,
    this.event,
    this.value,
    this.model,
    this.osVersion,
    this.brand,
    this.deviceId,
    this.latitude,
    this.longitude,
  });

  final String? type;
  final String? screen;
  final String? event;
  final String? value;
  final String? model;
  final String? osVersion;
  final String? brand;
  final String? deviceId;
  final String? latitude;
  final String? longitude;

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadToJson(this);
}

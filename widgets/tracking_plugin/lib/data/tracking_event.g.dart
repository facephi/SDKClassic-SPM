// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingEvent _$TrackingEventFromJson(Map<String, dynamic> json) {
  return TrackingEvent(
    family: json['family'] as String,
    sessionId: json['sessionId'] as String,
    operationId: json['operationId'] as String,
    events: (json['events'] as List<dynamic>)
        .map((e) => Event.fromJson(e as Map<String, dynamic>))
        .toList(),
    tenantId: json['tenantId'] as String,
    version: json['version'] as int,
    source: json['source'] as String,
  );
}

Map<String, dynamic> _$TrackingEventToJson(TrackingEvent instance) =>
    <String, dynamic>{
      'version': instance.version,
      'tenantId': instance.tenantId,
      'source': instance.source,
      'family': instance.family,
      'sessionId': instance.sessionId,
      'operationId': instance.operationId,
      'events': instance.events,
    };

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    eventId: json['eventId'] as String,
    payload: Payload.fromJson(json['payload'] as Map<String, dynamic>),
    clientTimestamp: json['clientTimestamp'] as String,
  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'eventId': instance.eventId,
      'payload': instance.payload,
      'clientTimestamp': instance.clientTimestamp,
    };

Payload _$PayloadFromJson(Map<String, dynamic> json) {
  return Payload(
    type: json['type'] as String?,
    screen: json['screen'] as String?,
    event: json['event'] as String?,
    value: json['value'] as String?,
    model: json['model'] as String?,
    osVersion: json['osVersion'] as String?,
    brand: json['brand'] as String?,
    deviceId: json['deviceId'] as String?,
    latitude: json['latitude'] as String?,
    longitude: json['longitude'] as String?,
  );
}

Map<String, dynamic> _$PayloadToJson(Payload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('screen', instance.screen);
  writeNotNull('event', instance.event);
  writeNotNull('value', instance.value);
  writeNotNull('model', instance.model);
  writeNotNull('osVersion', instance.osVersion);
  writeNotNull('brand', instance.brand);
  writeNotNull('deviceId', instance.deviceId);
  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  return val;
}

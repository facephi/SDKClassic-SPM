import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:tracking_plugin/data/tracking_event.dart';
import 'package:tracking_plugin/tracking_service.dart';
import 'package:uuid/uuid.dart';

class TrackingPlugin {
  TrackingPlugin(this.service);

  TrackingService service;

  String id = "";
  String type = "";
  String sessionId = "";

  void initIds() {
    this.id = "";
    this.sessionId = "";
    this.type = "";
  }

  Future<Response<String>> sendCustomerId(String customerId) async {
    TrackingEvent e = TrackingEvent(
        family: type,
        sessionId: sessionId,
        operationId: id,
        events: [
          Event(
            eventId: const Uuid().v4(),
            payload: Payload(
                type: type, event: 'SET_CUSTOMER_ID', value: customerId),
            clientTimestamp: DateTime
                .now()
                .millisecondsSinceEpoch
                .toString(),
          )
        ]);

    Response<String> response = await sendEvent(e);
    return response;
  }

  Future<Response<String>> externalEvent(String screen, String event) async {
    TrackingEvent e = TrackingEvent(
        family: type,
        sessionId: sessionId,
        operationId: id,
        events: [
          Event(
            eventId: const Uuid().v4(),
            payload: Payload(type: type, screen: screen, event: event),
            clientTimestamp: DateTime
                .now()
                .millisecondsSinceEpoch
                .toString(),
          )
        ]);

    Response<String> response = await sendEvent(e);
    return response;
  }

  Future<Response<String>> sendStep(String step) async {
    TrackingEvent e = TrackingEvent(
        family: type,
        sessionId: sessionId,
        operationId: id,
        events: [
          Event(
            eventId: const Uuid().v4(),
            payload: Payload(
              type: type,
              event: 'STEP_CHANGE',
              screen: step,
              value: step,
            ),
            clientTimestamp: DateTime
                .now()
                .millisecondsSinceEpoch
                .toString(),
          )
        ]);

    Response<String> response = await sendEvent(e);
    return response;
  }

  Future<Response<String>> deviceInfo(String model,
      String osVersion,
      String brand,
      String deviceId,) async {
    TrackingEvent e = TrackingEvent(
        family: 'DEVICE_TRACKING',
        sessionId: sessionId,
        operationId: id,
        events: [
          Event(
            eventId: const Uuid().v4(),
            payload: Payload(
              type: 'DEVICE',
              model: model,
              osVersion: osVersion,
              brand: brand,
              deviceId: deviceId,
            ),
            clientTimestamp: DateTime
                .now()
                .millisecondsSinceEpoch
                .toString(),
          )
        ]);

    Response<String> response = await sendEvent(e);
    return response;
  }

  Future<Response<String>> coordinates(String latitude,
      String longitude) async {
    TrackingEvent e = TrackingEvent(
        family: type,
        sessionId: sessionId,
        operationId: id,
        events: [
          Event(
            eventId: const Uuid().v4(),
            payload: Payload(
              type: 'COORDINATES',
              latitude: latitude,
              longitude: longitude,
            ),
            clientTimestamp: DateTime
                .now()
                .millisecondsSinceEpoch
                .toString(),
          )
        ]);

    Response<String> response = await sendEvent(e);
    return response;
  }

  Future<Response<String>> sendOnboardingStepFlow() async {
    TrackingEvent e = TrackingEvent(
        family: type,
        sessionId: sessionId,
        operationId: id,
        events: [
          Event(
            eventId: const Uuid().v4(),
            payload: Payload(
                type: type,
                event: 'STEPS_FLOW',
                screen: "START",
                value: "START,SELPHI_WIDGET,SELPHID_WIDGET,FINISH"
            ),
            clientTimestamp: DateTime
                .now()
                .millisecondsSinceEpoch
                .toString(),
          )
        ]);

    Response<String> response = await sendEvent(e);
    return response;
  }

  Future<Response<String>> sendAuthenticationStepFlow() async {
    TrackingEvent e = TrackingEvent(
        family: type,
        sessionId: sessionId,
        operationId: id,
        events: [
          Event(
            eventId: const Uuid().v4(),
            payload: Payload(
                type: type,
                event: 'STEPS_FLOW',
                screen: "START",
                value: "START,SELPHI_WIDGET,FINISH"
            ),
            clientTimestamp: DateTime
                .now()
                .millisecondsSinceEpoch
                .toString(),
          )
        ]);

    Response<String> response = await sendEvent(e);
    return response;
  }

  Future<Response<String>> sendWidgetEvents(List<Event> events) async {
    TrackingEvent e = TrackingEvent(
        family: type,
        sessionId: sessionId,
        operationId: id,
        events: events);

    Response<String> response = await sendEvent(e);
    return response;
  }

  Future<Response<String>> sendEvent(TrackingEvent e) async {
    String sendJson = jsonEncode(e);
    Response<String> response = await service.postEvent(sendJson);
    return response;
  }
}

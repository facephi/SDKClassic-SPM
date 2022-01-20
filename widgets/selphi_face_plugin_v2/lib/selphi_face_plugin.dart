import 'dart:async';
import 'package:flutter/services.dart';
import 'SelphiFaceConfiguration.dart';

class SelphiFacePlugin {
  static const MethodChannel _channel = MethodChannel('selphi_face_plugin');

  static Future<Map> startSelphiFaceWidget({
    required String resourcesPath,
    required SelphiFaceConfiguration widgetConfigurationJSON,
  }) async {
    final Map result = await _channel.invokeMethod('startSelphiFaceWidget', {"resourcesPath": resourcesPath, "widgetConfigurationJSON": widgetConfigurationJSON.toJson()});
    return result;
  }

  static Future<String> generateTemplateRaw({
    required String imageBase64
  }) async {
    final String result = await _channel.invokeMethod('generateTemplateRaw', {"imageBase64": imageBase64});
    return result;
  }

  static Future<dynamic> getCameras() async {
    final dynamic result = await _channel.invokeMethod('getDeviceCameras');
    return result;
  }
}

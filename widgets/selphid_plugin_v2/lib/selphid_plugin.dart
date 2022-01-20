import 'dart:async';
import 'package:flutter/services.dart';
import 'SelphIDConfiguration.dart';
import 'SelphIDOperation.dart';
import 'SelphIDTestType.dart';

class SelphidPlugin {
  static const MethodChannel _channel = MethodChannel('selphid_plugin');

  static Future<Map> startSelphIDWidget({
    required SelphIDOperation operationMode,
    required String resourcesPath,
    required String widgetLicense,
    required String previousOCRData,
    required SelphIDConfiguration widgetConfigurationJSON,
  }) async {
    final Map result = await _channel.invokeMethod('startSelphIDWidget', {"operationMode":operationMode.toString(), "resourcesPath": resourcesPath,
      "widgetLicense": widgetLicense, "previousOCRData":previousOCRData, "widgetConfigurationJSON": widgetConfigurationJSON.toJson()});
    return result;
  }

  static Future<Map> startSelphIDTestImageWidget({
    required SelphIDOperation operationMode,
    required String resourcesPath,
    required String widgetLicense,
    required String previousOCRData,
    required SelphIDConfiguration widgetConfigurationJSON,
    required String testImageName,
    required SelphIDTestType testType,
  }) async {
    final Map result = await _channel.invokeMethod('startSelphIDTestImageWidget', {"operationMode":operationMode.toString(), "resourcesPath": resourcesPath,
      "widgetLicense": widgetLicense, "previousOCRData":previousOCRData, "widgetConfigurationJSON": widgetConfigurationJSON.toJson(), "testImageName": testImageName, "testType": testType.toString()});
    return result;
  }

  static Future<dynamic> getCameras() async {
    final dynamic result = await _channel.invokeMethod('getDeviceCameras');
    return result;
  }

  static Future<String> tokenize({required String data}) async {
    final String result = await _channel.invokeMethod('tokenize', {"data": data.toString()});
    return result;
  }
}
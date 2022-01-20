import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:selphi_face_plugin/selphi_face_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('selphi_face_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });
}

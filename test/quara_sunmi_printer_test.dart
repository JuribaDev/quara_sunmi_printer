import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/quara_sunmi_printer.dart';

void main() {
  const MethodChannel channel = MethodChannel('quara_sunmi_printer');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await QuaraSunmiPrinter.platformVersion, '42');
  });
}

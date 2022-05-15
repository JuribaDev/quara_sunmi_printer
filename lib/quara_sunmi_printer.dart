
import 'dart:async';

import 'package:flutter/services.dart';

class QuaraSunmiPrinter {
  static const MethodChannel _channel = MethodChannel('quara_sunmi_printer');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

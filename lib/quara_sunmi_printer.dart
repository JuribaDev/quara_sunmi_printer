import 'dart:async';

import 'package:flutter/services.dart';

class QuaraSunmiPrinter {
  static const MethodChannel _channel = MethodChannel('quara_sunmi_printer');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  ///*bindingPrinter*
  ///
  ///This method will intializate the printer to start the whole print.
  ///This method *Must* be executed before any other print and LCD command.
  static Future<bool?> bindingPrinter() async {
    final bool? status = await _channel.invokeMethod('BIND_PRINTER_SERVICE');
    return status;
  }

  ///*unbindingPrinter*
  ///
  ///This method is the opposite of [bindingPrinter].
  ///This will unbind or 'close' the connection with the printer, and must be the last execution.

  static Future<bool?> unbindingPrinter() async {
    final bool? status = await _channel.invokeMethod('UNBIND_PRINTER_SERVICE');
    return status;
  }
}

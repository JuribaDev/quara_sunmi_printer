import 'dart:async';

import 'package:flutter/services.dart';

import 'enums.dart';

class QuaraSunmiPrinter {
  static const MethodChannel _channel = MethodChannel('quara_sunmi_printer');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  ///*getPrinterPaperSize*
  ///
  ///This method will get the printer paper size
  static Future<String> getPrinterPaperSize() async {
    final String printerPaperSize = await _channel.invokeMethod('GET_PRINTER_PAPER_SIZE');
    return printerPaperSize;
  }

  ///*getPrinterSerialNumber*
  ///
  ///This method will get the printer serial number.

  static Future<String> getPrinterSerialNumber() async {
    final String printerSerialNumber = await _channel.invokeMethod('GET_PRINTER_SERIAL_NUMBER');
    return printerSerialNumber;
  }

  ///*getDeviceModel*
  ///
  ///This method will get the device model.

  static Future<String> getDeviceModel() async {
    final String deviceModel = await _channel.invokeMethod('GET_DEVICE_MODEL');
    return deviceModel;
  }

  ///*getPrinterVersion*
  ///
  ///This method will get the printer version.

  static Future<String> getPrinterVersion() async {
    final String printerVersion = await _channel.invokeMethod('GET_PRINTER_VERSION');
    return printerVersion;
  }

  ///*getPrinterStatus*
  ///
  ///This method will give you the status of the printer.
  static Future<String> getPrinterStatus() async {
    final String status = await _channel.invokeMethod('SHOW_PRINTER_STATUS');

    return status;
  }

  ///*cutPaper*
  ///
  ///This method will cut the paper and throws exception on machines without a cutter.
  static Future<void> cutPaper() async => await _channel.invokeMethod('CUT_PAPER');

  ///*printText*
  ///
  ///This method will print a simple text in your printer
  static Future<void> printText(
      {required String text, required int fontSize, required bool isBold, required bool isUnderLine}) async {
    Map<String, dynamic> arguments = <String, dynamic>{
      "text": '$text\n',
      "fontSize": fontSize,
      "isBold": isBold,
      "isUnderLine": isUnderLine
    };
    await _channel.invokeMethod("PRINT_TEXT", arguments);
  }

  ///*setAlign*
  ///
  static Future<void> setAlign({
    required SunmiPrintAlign sunmiPrintAlign,
  }) async {
    int align = 1;
    switch (sunmiPrintAlign) {
      case SunmiPrintAlign.LEFT:
        align = 0;
        break;
      case SunmiPrintAlign.CENTER:
        align = 1;
        break;
      case SunmiPrintAlign.RIGHT:
        align = 2;
        break;
    }
    Map<String, dynamic> arguments = <String, dynamic>{
      "align": 1,
    };
    await _channel.invokeMethod("SET_ALIGN", arguments);
  }

  ///*feedPaper*
  ///
  ///This method will print a simple empty line.
  static Future<void> feedPaper() async {
    await _channel.invokeMethod("FEED_PAPER");
  }
}

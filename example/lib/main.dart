import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quara_sunmi_printer/enums.dart';
import 'package:quara_sunmi_printer/quara_sunmi_printer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _printerStatus = 'Unknown';
  String _printerSerialNumber = 'Unknown';
  String _printerDeviceModel = 'Unknown';
  String _printerVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
    getPrinterStatus();
  }

  Future<void> getPrinterStatus() async {
    _printerStatus = await QuaraSunmiPrinter.getPrinterStatus();
    _printerSerialNumber = await QuaraSunmiPrinter.getPrinterSerialNumber();
    _printerDeviceModel = await QuaraSunmiPrinter.getDeviceModel();
    _printerVersion = await QuaraSunmiPrinter.getPrinterVersion();
    setState(() {});
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await QuaraSunmiPrinter.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $_platformVersion\n'),
              ElevatedButton(onPressed: () async {}, child: const Icon(Icons.print)),
              Text(_printerStatus.toString()),
              Text(_printerVersion.toString()),
              Text(_printerDeviceModel.toString()),
              Text(_printerSerialNumber.toString()),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: () async => await QuaraSunmiPrinter.cutPaper(), child: const Text('Cut paper')),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async => await QuaraSunmiPrinter.feedPaper(), child: const Text('Feed paper')),
              ElevatedButton(
                  onPressed: () async {
                    await QuaraSunmiPrinter.printText(
                        text: 'hi from flutter',
                        sunmiPrintAlign: SunmiPrintAlign.LEFT,
                        fontSize: 30,
                        isBold: true,
                        isUnderLine: false);
                    await QuaraSunmiPrinter.printEmptyLine();
                    await QuaraSunmiPrinter.printQrcode(
                        qrCode:
                            ';ajsdf;kjasjkfd;ajsd;flkjaslkdfjlkasjdflkajsdfkljhaskdghaksjdgfklasjdflkajsdklfjalksdjasdkjfljflasjdflkasjdlfjalsdjflaksjdflkajsdflkjasdflkjasdlfkjasldkfjlaskdjflkasjdflkjasflkjasd',
                        moduleSize: 5,
                        errorLevelCorrection: 1);
                    await QuaraSunmiPrinter.printEmptyLine();
                    await QuaraSunmiPrinter.printText(
                        text: 'hi from flutter',
                        sunmiPrintAlign: SunmiPrintAlign.CENTER,
                        fontSize: 30,
                        isBold: false,
                        isUnderLine: true);
                    await QuaraSunmiPrinter.feedPaper();
                  },
                  child: const Text('Print text')),
            ],
          ),
        ),
      ),
    );
  }
}

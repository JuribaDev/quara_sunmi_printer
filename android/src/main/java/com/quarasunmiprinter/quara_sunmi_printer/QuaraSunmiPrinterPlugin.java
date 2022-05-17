package com.quarasunmiprinter.quara_sunmi_printer;

import android.content.Context;
import android.widget.Toast;

import androidx.annotation.NonNull;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.quarasunmiprinter.quara_sunmi_printer.utils.SunmiPrintHelper;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** QuaraSunmiPrinterPlugin */
public class QuaraSunmiPrinterPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  Context context;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    SunmiPrintHelper.getInstance().initSunmiPrinterService(flutterPluginBinding.getApplicationContext());

    context = flutterPluginBinding.getApplicationContext();

    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "quara_sunmi_printer");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case "getPlatformVersion":
        result.success("Android " + android.os.Build.VERSION.RELEASE);
        break;
      case "SHOW_PRINTER_STATUS":
        result.success(SunmiPrintHelper.getInstance().showPrinterStatus(this.context));
        break;

        case "GET_PRINTER_PAPER_SIZE":
        result.success(SunmiPrintHelper.getInstance().getPrinterPaper());
        break;

        case "INIT_PRINTER":
          SunmiPrintHelper.getInstance().initPrinter();
        result.success(true);
        break;

        case "GET_PRINTER_SERIAL_NUMBER":
        result.success(SunmiPrintHelper.getInstance().getPrinterSerialNo());
        break;

        case "GET_DEVICE_MODEL":
        result.success(SunmiPrintHelper.getInstance().getDeviceModel());
        break;

        case "GET_PRINTER_VERSION":
        result.success(SunmiPrintHelper.getInstance().getPrinterVersion());
        break;

        case "CUT_PAPER":
        SunmiPrintHelper.getInstance().cutPaper();
          result.success(true);
        break;

        case "FEED_PAPER":
        SunmiPrintHelper.getInstance().feedPaper();
          result.success(true);
        break;

        case "SET_ALIGN":
          int align = call.argument("align");
          SunmiPrintHelper.getInstance().setAlign(align);

          result.success(true);
        break;

        case "PRINT_QRCODE":
          String data = call.argument("qrcode");
          int moduleSize = call.argument("moduleSize");
          int errorLevelCorrection = call.argument("errorLevelCorrection");
          SunmiPrintHelper.getInstance().printQr(data,moduleSize,errorLevelCorrection);

          result.success(true);
        break;
        case "PRINT_TEXT":
          String text = call.argument("text");
          int fontSize = call.argument("fontSize");
          int textAlign = call.argument("align");
          boolean isBold = call.argument("isBold");
          boolean isUnderLine = call.argument("isUnderLine");
          SunmiPrintHelper.getInstance().setAlign(textAlign);
          SunmiPrintHelper.getInstance().printText(text,fontSize,isBold,isUnderLine,null);

          result.success(true);
        break;


      default:
        result.notImplemented();
        break;
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}

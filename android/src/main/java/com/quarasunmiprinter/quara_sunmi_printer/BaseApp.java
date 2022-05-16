package com.quarasunmiprinter.quara_sunmi_printer;

import android.app.Application;

import com.quarasunmiprinter.quara_sunmi_printer.utils.SunmiPrintHelper;

public class BaseApp extends Application {

    @Override
    public void onCreate() {
        super.onCreate();
        init();
    }

    /**
     * Connect print service through interface library
     */
    private void init(){
        SunmiPrintHelper.getInstance().initSunmiPrinterService(this);
    }
}

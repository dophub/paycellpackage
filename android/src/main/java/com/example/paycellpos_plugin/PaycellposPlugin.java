package com.example.paycellpos_plugin;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

import androidx.annotation.NonNull;

import com.dgpays.mposgatewaylib.LaunchMposInterface;

import java.util.ArrayList;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;


/**
 * PaycellposPlugin
 */
public class PaycellposPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.NewIntentListener {

    private static final String CHANNEL = "paycellpos_plugin";
    private MethodChannel channel;
    Context applicationContext;
    private Activity activity;

    ArrayList<Result> list = new ArrayList<Result>();

    @Override
    public void onAttachedToEngine(FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), CHANNEL);
        channel.setMethodCallHandler(this);
        applicationContext = flutterPluginBinding.getApplicationContext();
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        this.activity = binding.getActivity();
        binding.addOnNewIntentListener(this); // onNewIntent listener'ı ekleniyor.
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        this.activity = null;
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        this.activity = binding.getActivity();
        binding.addOnNewIntentListener(this); // Yeniden listener ekleyin.
    }

    @Override
    public void onDetachedFromActivity() {
        this.activity = null;
    }

    @Override
    public void onDetachedFromEngine(FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        String arguments = call.arguments();
        switch (call.method) {
            case "startOperation":
            case "getPaymentDetail":
                list.add(result);
                launchPaycellPos(arguments, 1);
                break;
            case "completeOperation":
                list.add(result);
                launchPaycellPos(arguments, 2);
                break;
            case "checkIfPosAvailable":
                list.add(result);
                launchPaycellPos(arguments, 5);
                break;
            case "endOfDayRequest":
                list.add(result);
                launchPaycellPos(arguments, 6);
                break;
        }
    }


    private void launchPaycellPos(String requestBody, int reqCode) {
        log("---> PaycellPlugin", "requestCode =" + reqCode + ",requestBody =" + requestBody);
        LaunchMposInterface.launchMpos(activity, "siparisim.paycell.integration", requestBody);
    }

    @Override
    public boolean onNewIntent(@NonNull Intent intent) {
        try {
            String message = "";
            message = intent.getData().getQueryParameter("message");
            MethodChannel.Result result = list.get(0);
            if (result == null) return true;
            result.success(message);
            list.remove(result);
            log("<--- PaycellPlugin", "responseData =" + message);
        } catch (Exception e) {
            MethodChannel.Result result = list.get(0);
            if (result == null) return true;
            result.success(null);
            list.remove(result);
            e.printStackTrace();
            log("PaycellPlugin", "Exception2 =" + e.getMessage());
        }
        return true;
    }


    void log(String tag, String msg) {
        try {
            Log.i(tag, msg);
        } finally {
        }
    }
}








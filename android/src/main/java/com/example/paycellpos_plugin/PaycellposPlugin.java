package com.example.paycellpos_plugin;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import androidx.annotation.NonNull;

import com.dgpays.mposgatewaylib.LaunchMposInterface;

import java.util.HashMap;
import java.util.Map;
import java.util.Queue;

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
public class PaycellposPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {
    private static final String CHANNEL = "paycellpos_plugin";
    private MethodChannel channel;
    Context applicationContext;
    private Activity activity;

    HashMap<Integer, MethodChannel.Result> map = new HashMap<>();

    @Override
    public void onAttachedToEngine(FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), CHANNEL);
        channel.setMethodCallHandler(this);
        applicationContext = flutterPluginBinding.getApplicationContext();
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        this.activity = binding.getActivity();
        binding.addActivityResultListener(this);
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        this.activity = null;
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        this.activity = binding.getActivity();
        binding.addActivityResultListener(this);
    }

    @Override
    public void onDetachedFromActivity() {
        this.activity = null;
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        String arguments = call.arguments();
        switch (call.method) {
            case "startOperation":
                map.put(1, result);
                launchPaycellPos(arguments, 1);
                break;
            case "completeOperation":
                map.put(2, result);
                launchPaycellPos(arguments, 2);
                break;
            case "checkIfPosAvailable":
                map.put(5, result);
                launchPaycellPos(arguments, 5);
                break;
            case "endOfDayRequest":
                map.put(6, result);
                launchPaycellPos(arguments, 6);
                break;
        }
    }

    @Override
    public void onDetachedFromEngine(FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }

    private void launchPaycellPos(String requestBody, int reqCode) {
        log("---> PaycellPlugin", "requestCode =" + reqCode + ",requestBody =" + requestBody);
        LaunchMposInterface.launchMpos(applicationContext, activity, requestBody, reqCode, data -> {
            try {
                MethodChannel.Result result = map.get(reqCode);
                if (result == null) return;
                result.success(data.getMessage());
                map.remove(reqCode);
                log("<--- PaycellPlugin", "requestCode =" + reqCode + ",resultCode =" + data.getCode() + ",responseData =" + data.getMessage());
            } catch (Exception e) {
                e.printStackTrace();
                MethodChannel.Result result = map.get(reqCode);
                if (result == null) return;
                result.success(null);
                map.remove(reqCode);
                log("PaycellPlugin", "Exception1 =" + e.getMessage());
            }
        });
    }

    @Override
    public boolean onActivityResult(int reqCode, int resultCode, Intent data) {
        try {
            MethodChannel.Result result = map.get(reqCode);
            if (result == null) return true;
            Object response = data.getExtras().getString("mposResult");
            result.success(response);
            map.remove(reqCode);
            log("<--- PaycellPlugin", "requestCode =" + reqCode + ",resultCode =" + resultCode + ",responseData =" + response);
        } catch (Exception e) {
            MethodChannel.Result result = map.get(reqCode);
            if (result == null) return true;
            result.success(null);
            map.remove(reqCode);
            e.printStackTrace();
            log("PaycellPlugin", "Exception2 =" + e.getMessage());
        }
        return true;
    }

    void log(String tag, String msg) {
        try {
            Log.i(tag, msg);
        } finally {}
    }
}








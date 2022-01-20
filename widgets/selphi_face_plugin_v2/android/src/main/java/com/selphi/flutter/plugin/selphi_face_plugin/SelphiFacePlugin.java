package com.selphi.flutter.plugin.selphi_face_plugin;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;

import com.facephi.fphiwidgetcore.WidgetConfiguration;
import com.facephi.fphiwidgetcore.WidgetResult;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * SelphiFacePlugin
 */
public class SelphiFacePlugin implements ActivityAware, FlutterPlugin, MethodCallHandler, PluginRegistry.ActivityResultListener {
    /// The MethodChannel that will the communication between Flutter and native Android
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;

    private static final String START_WIDGET = "startSelphiFaceWidget";
    private static final String GENERATE_TEMPLATE = "generateTemplateRaw";
    private static final String DEVICE_CAMERAS = "getDeviceCameras";
    private static final String JSON_ERROR = "8200";
    private static final String NATIVE_ERROR = "8202";
    private static final String NATIVE_RESULT_ERROR = "8203";

    private static final int SELPHI_FACE_PLUGIN_OPERATION_AUTHENTICATE = 19101;

    private float _jpgQuality = 0.8f;

    private Activity mActivity;
    private Result mResult = null;
    private FlutterActivity mFlutterActivity;
    private boolean _enableGenerateTemplateRaw = false;
    private BinaryMessenger messenger;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        this.messenger  = flutterPluginBinding.getBinaryMessenger();
        this.channel    = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "selphi_face_plugin");
        this.channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        this.mResult = result;

        if (call.method.equals(START_WIDGET)) {
            try {
                launchWidget(call);
            } catch (Exception e) {
                this.mResult.error(JSON_ERROR, "JSONException", e.getMessage());
                return;
            }
        }
        else if (call.method.equals(GENERATE_TEMPLATE))
        {
            if (call.hasArgument("imageBase64")) {
                Bitmap bmpImage = SelphiFaceImageUtils.toBitmap(call.argument("imageBase64"));
                byte[] bmpTemplate = WidgetConfiguration.generateTemplateRawFromBitmap(bmpImage);
                this.mResult.success(SelphiFaceImageUtils.toBase64(bmpTemplate));
                return;
            } else {
                this.mResult.error(NATIVE_RESULT_ERROR, "Parameter 'imageBase64' doesn't exist", null);
                return;
            }
        }
        else if (call.method.equals(DEVICE_CAMERAS))
        {
            this.getDeviceCameras();
        }
        else {
            this.mResult.error(NATIVE_RESULT_ERROR, "Plugin not implemented", null);
            return;
        }
    }

    public void getDeviceCameras() {
        try {
            WidgetConfiguration conf = new WidgetConfiguration();
            ArrayList<String> cameras = conf.getDeviceCameras();

            this.mResult.success(cameras);
        }
        catch (Exception exc) {
            this.mResult.error(NATIVE_RESULT_ERROR, "getDeviceCameras failed", null);
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        this.channel.setMethodCallHandler(null);
    }

    /**
     * Processes the activity result from the User Control.
     *
     * @param requestCode Code Request
     * @param resultCode  Operation code
     * @param data        Result of the User Control
     */
    @Override
    public boolean onActivityResult(int requestCode, int resultCode, Intent data) {
        try {
            if (requestCode != SELPHI_FACE_PLUGIN_OPERATION_AUTHENTICATE)
                return false;

            if (this.mResult == null)
                throw new Exception("Data processing error.");

            if (data == null) {
                this.mResult.error(NATIVE_RESULT_ERROR, "The widget result is null.", null);
                return false;
            }

            WidgetResult ucResult = data.getParcelableExtra("result");
            SelphiFaceOutputBundle output = new SelphiFaceOutputBundle(ucResult, _jpgQuality, _enableGenerateTemplateRaw);

            this.mResult.success(output.ReturnOutputJSON());
        }
        catch (Exception exc) {
            this.mResult.error(NATIVE_RESULT_ERROR, exc.getMessage(), null);
            return false;
        }
        return true;
    }

    private void launchWidget(MethodCall call) throws Exception {
        if (!call.hasArgument("widgetConfigurationJSON")) {
            this.mResult.error(NATIVE_RESULT_ERROR, "Parameter 'widgetConfigurationJSON' doesn't exist", null);
            return;
        }

        JSONObject widgetConfigurationJSON = new JSONObject((HashMap<String, Object>) call.argument("widgetConfigurationJSON"));
        String resourcesPath = call.hasArgument("resourcesPath") ? call.argument("resourcesPath") : "";
        _enableGenerateTemplateRaw = (widgetConfigurationJSON.length() > 0) ? widgetConfigurationJSON.optBoolean("enableGenerateTemplateRaw", false) : false;

        this.launchActivityUC(SelphiFaceConfiguration.createWidgetConfiguration(resourcesPath, widgetConfigurationJSON, this.messenger, this.mFlutterActivity), SELPHI_FACE_PLUGIN_OPERATION_AUTHENTICATE);
    }

    /**
     * Launches the User Control Activity selected by the user.
     *
     * @param conf      The User Control configuration
     * @param operation Index of the User Control operation
     * @return True if plugin handles a particular action, and "false" otherwise. Note that this does indicate the success or failure of the handling.
     * Indicating success is failure is done by calling the appropriate method on the callbackContext. While our code only passes back a message
     */
    private boolean launchActivityUC(WidgetConfiguration conf, int operation) {
        try {
            Intent intent = new Intent(this.mActivity, com.facephi.selphi.Widget.class);
            intent.putExtra("configuration", conf);

            this.mActivity.startActivityForResult(intent, operation);
        } catch (Exception exc) {
            System.err.println("Exception: " + exc.getMessage());
            this.mResult.error(NATIVE_ERROR, exc.getMessage(), null);
        }
        return true;
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        /* onAttachedToActivity: SIMIL CONSTRUCTOR */
        binding.addActivityResultListener(this); //this es SelphiFacePlugin

        this.mActivity = binding.getActivity();
        this.mFlutterActivity = (FlutterActivity) binding.getActivity();
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() { }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) { }

    @Override
    public void onDetachedFromActivity() { }
}
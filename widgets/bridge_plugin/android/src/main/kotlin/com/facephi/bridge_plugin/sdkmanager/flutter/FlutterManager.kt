package com.facephi.bridge_plugin.sdkmanager.flutter

import android.content.Context
import com.facephi.bridge_plugin.sdkmanager.data.Constants
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterActivityLaunchConfigs
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel

internal class FlutterManager(private val context: Context, private val flutterContract: FlutterContract) {
    private lateinit var flutterEngine: FlutterEngine
    companion object{
        const val SUCCESS = "OK"
    }

    fun launchSdk(method: String, data: String) {
        createFlutterEngine()

        if(method == Constants.initSelphiMethod || method == Constants.initSelphidMethod || method == Constants.onboardingMethod || method == Constants.authenticationMethod){
            context.startActivity(
                FlutterActivity
                    .withCachedEngine(Constants.FLUTTER_ENGINE_ID)
                    .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.opaque)
                    .destroyEngineWithActivity(true)
                    .build(context)
            )
        }

        startMethodChannel(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            Constants.CHANNEL
        ).invokeMethod(method, data)
    }

    private fun createFlutterEngine() {
        // Instantiate a FlutterEngine.
        flutterEngine = FlutterEngine(context)

        // Start executing Dart code to pre-warm the FlutterEngine.
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        // Cache the FlutterEngine to be used by FlutterActivity.
        FlutterEngineCache
            .getInstance()
            .put(Constants.FLUTTER_ENGINE_ID, flutterEngine)
    }

    private fun startMethodChannel(flutterEngine: FlutterEngine) {
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            Constants.CHANNEL
        ).setMethodCallHandler { call, result ->
            flutterContract.onMethodFinished(call.method, call.arguments.toString())
            result.success(SUCCESS)
        }
    }
}
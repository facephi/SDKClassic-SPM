package com.facephi.bridge_plugin.sdkmanager.flutter

internal interface FlutterContract {
    fun onMethodFinished(method: String, arguments: String)
}
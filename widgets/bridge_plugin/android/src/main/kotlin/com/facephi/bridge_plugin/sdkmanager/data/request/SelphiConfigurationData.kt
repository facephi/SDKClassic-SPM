package com.facephi.bridge_plugin.sdkmanager.data.request

data class SelphiConfigurationData(
    var debug: Boolean = false,
    var fullscreen: Boolean = true,
    var crop: Boolean = false,
    var cropPercent : Double = 1.0,
    var sceneTimeout: Double = 0.0,
    var livenessMode: String = SelphiFaceLivenessMode.LM_PASSIVE,
    var jpgQuality: Double = 0.95,
    var qrValidatorExpression: String = "",
    var enableImages: Boolean = false,
    var uTags: String = "",
    var frontalCameraPreferred: Boolean = true,
    var locale: String = "",
    var stabilizationMode: Boolean = false,
    var templateRawOptimized: Boolean = true,
    var desiredCameraWidth: Int = 0,
    var desiredCameraHeight: Int = 0,
    var enableGenerateTemplateRaw: Boolean = false,
    var enableWidgetEventListener: Boolean = true,
    var qrMode: Boolean = false,
    var translationsContent: String = "",
    var viewsContent: String = ""
)

class SelphiFaceLivenessMode{
    companion object{
        const val LM_PASSIVE = "PASSIVE"
        const val LM_NONE = "NONE"
    }
}

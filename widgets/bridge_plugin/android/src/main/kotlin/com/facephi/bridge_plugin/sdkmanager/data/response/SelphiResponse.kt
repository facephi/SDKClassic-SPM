package com.facephi.bridge_plugin.sdkmanager.data.response

data class SelphiResponse(
    var  errorMessage : String = "",
    var  templateRaw : String = "",
    var  eyeGlassesScore : Double = 0.0,
    var  templateScore : Double = 0.0,
    var  qrData : String = "",
    var  bestImage : String = "",
    var  bestImageCropped: String = ""
)


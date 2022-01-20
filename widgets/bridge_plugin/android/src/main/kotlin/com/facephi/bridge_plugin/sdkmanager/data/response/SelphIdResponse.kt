package com.facephi.bridge_plugin.sdkmanager.data.response

data class SelphIdResponse(
    var finishStatusDescription : String = "",
    var documentData : String = "",
    var tokenBackDocument : String = "",
    var tokenFrontDocument : String = "",
    var tokenFaceImage : String = "",
    var tokenOCR : String = "",
    var documentCaptured : String? = "",
    var matchingSidesScore : Double = 0.0,
    var captureProgress : Int = 0,
    var tokenRawFrontDocument : String? = "",
    var tokenRawBackDocument : String? = "",
    var frontDocumentImage : String = "",
    var faceImage : String = "",
    var signatureImage : String? = "",
    var backDocumentImage : String = "",
    var fingerprintImage : String? = "",
    var rawFrontDocument : String? = "",
    var rawBackDocument : String? = ""
)



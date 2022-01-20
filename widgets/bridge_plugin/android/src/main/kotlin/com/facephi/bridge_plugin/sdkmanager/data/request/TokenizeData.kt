package com.facephi.bridge_plugin.sdkmanager.data.request

internal data class TokenizeData(
    var sessionId: String = "",
    var operationId: String = "",
    var family: String = "ONBOARDING"
)

package com.facephi.bridge_plugin.sdkmanager.data.request

internal data class InitOperationRequest(
    var operationId: String = "",
    var type: String = "ONBOARDING"
)

enum class OperationType{
    ONBOARDING, AUTHENTICATION

}



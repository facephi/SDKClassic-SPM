package com.facephi.sdkmanager.data.request

internal data class InitProcessRequest(
    var id: String = "",
    var type: String = "ONBOARDING"
)

enum class ProcessType{
    ONBOARDING, AUTHENTICATION

}



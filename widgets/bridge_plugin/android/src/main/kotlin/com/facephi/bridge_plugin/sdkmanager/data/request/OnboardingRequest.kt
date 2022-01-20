package com.facephi.bridge_plugin.sdkmanager.data.request

data class OnboardingRequest(
    var operationId: String = "",
    var customerId: String = "",
    var selphiConfigurationData: SelphiConfigurationData,
    var selphIdConfigurationData: SelphIdConfigurationData
)

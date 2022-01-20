package com.facephi.bridge_plugin.sdkmanager.data.request

data class AuthenticationRequest(
    var operationId: String = "",
    var customerId: String = "",
    var selphiConfigurationData: SelphiConfigurationData
)

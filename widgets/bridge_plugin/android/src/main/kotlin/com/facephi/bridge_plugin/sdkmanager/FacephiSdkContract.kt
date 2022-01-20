package com.facephi.bridge_plugin.sdkmanager

import com.facephi.bridge_plugin.sdkmanager.data.response.SdkResponse

interface FacephiSdkContract {
    fun getSelphiResponse(sdkResponse: SdkResponse) { /* default implementation */ }
    fun getSelphIdResponse(sdkResponse: SdkResponse) { /* default implementation */ }
    fun getTrackingResponse(sdkResponse: SdkResponse) { /* default implementation */ }
    fun getInitSessionResponse(sdkResponse: SdkResponse)
    fun getInitOperationResponse(sdkResponse: SdkResponse) { /* default implementation */ }
    fun generateRawTemplateResponse(generateRawTemplateResponse: String?) { /* default implementation */ }
    fun getTokenizedString(tokenizedString: String?) { /* default implementation */ }
    fun getCloseSessionResponse(sdkResponse: SdkResponse)
    fun getSetCustomerIdResponse(sdkResponse: SdkResponse) { /* default implementation */ }
    fun getOnboardingResponse(sdkResponse: SdkResponse) { /* default implementation */ }
    fun getAuthenticationResponse(sdkResponse: SdkResponse) { /* default implementation */ }
}
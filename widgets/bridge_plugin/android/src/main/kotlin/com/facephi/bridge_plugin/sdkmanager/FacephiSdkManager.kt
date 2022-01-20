package com.facephi.bridge_plugin.sdkmanager

import android.content.Context
import com.facephi.bridge_plugin.sdkmanager.data.request.*
import com.facephi.bridge_plugin.sdkmanager.internalSdkManager.SdkManager

class FacephiSdkManager (private val context: Context, contract: FacephiSdkContract) {

    private var sdkManager : SdkManager = SdkManager(context, contract)

    fun launchSelphi(selphiConfigurationData: SelphiConfigurationData) {
        sdkManager.launchSelphi(selphiConfigurationData)
    }

    fun initSession(initSessionRequest: InitSessionRequest){
        sdkManager.initSession(initSessionRequest)
    }

    fun initOperation(operationId: String, operationType: OperationType){
        sdkManager.initOperation(InitOperationRequest(operationId,operationType.name))
    }

    fun launchOnboarding(onboardingRequest: OnboardingRequest){
        sdkManager.launchOnboarding(onboardingRequest)
    }

    fun launchAuthentication(authenticationRequest: AuthenticationRequest){
        sdkManager.launchAuthentication(authenticationRequest)
    }

    fun launchSelphId(selphIdConfigurationData: SelphIdConfigurationData) {
        sdkManager.launchSelphId(selphIdConfigurationData)
    }

    fun launchTracking(event: TrackingDataEvent, screen: String) {
        sdkManager.launchTracking(TrackingData(event.name, screen))
    }

    fun generateRawTemplate(base64: String) {
        sdkManager.generateRawTemplate(base64)

    }

    fun tokenize(sessionId: String, operationId: String, operationType: OperationType) {
        sdkManager.tokenize(sessionId, operationId, operationType)

    }

    fun setCustomerId(customerId: String) {
        sdkManager.setCustomerId(customerId)
    }

    fun closeSession() {
        sdkManager.closeSession()

    }

}
package com.facephi.bridge_plugin.sdkmanager.internalSdkManager

import android.content.Context
import android.util.Log
import com.facephi.bridge_plugin.sdkmanager.FacephiSdkContract
import com.facephi.bridge_plugin.sdkmanager.data.Constants
import com.facephi.bridge_plugin.sdkmanager.data.Constants.authenticationMethod
import com.facephi.bridge_plugin.sdkmanager.data.Constants.closeSessionMethod
import com.facephi.bridge_plugin.sdkmanager.data.Constants.customerTrackingMethod
import com.facephi.bridge_plugin.sdkmanager.data.Constants.generateRawTemplateMethod
import com.facephi.bridge_plugin.sdkmanager.data.Constants.initOperationMethod
import com.facephi.bridge_plugin.sdkmanager.data.Constants.initSelphiMethod
import com.facephi.bridge_plugin.sdkmanager.data.Constants.initSelphidMethod
import com.facephi.bridge_plugin.sdkmanager.data.Constants.initSessionMethod
import com.facephi.bridge_plugin.sdkmanager.data.Constants.onboardingMethod
import com.facephi.bridge_plugin.sdkmanager.data.Constants.tokenizeMethod
import com.facephi.bridge_plugin.sdkmanager.data.Constants.trackingMethod
import com.facephi.bridge_plugin.sdkmanager.data.request.*
import com.facephi.bridge_plugin.sdkmanager.data.response.ErrorType
import com.facephi.bridge_plugin.sdkmanager.data.response.SdkResponse
import com.facephi.bridge_plugin.sdkmanager.flutter.FlutterContract
import com.facephi.bridge_plugin.sdkmanager.flutter.FlutterManager
import com.google.gson.Gson

internal class SdkManager(private val context: Context, private val contract: FacephiSdkContract) {

    private val flutterContract: FlutterContract = object : FlutterContract {
        override fun onMethodFinished(method: String, arguments: String) {

            when (method) {
                Constants.selphiFinishedMethod -> {
                    Log.d("SDK_MANAGER","onMethodFinished: $method Result: $arguments")
                    contract.getSelphiResponse(Gson().fromJson(arguments, SdkResponse::class.java))
                }
                Constants.selphidFinishedMethod -> {
                    Log.d("SDK_MANAGER","-----> onMethodFinished: $method Result: $arguments")
                    contract.getSelphIdResponse(Gson().fromJson(arguments, SdkResponse::class.java))
                }
                Constants.trackingFinishedMethod -> {
                    Log.d("SDK_MANAGER","-----> onMethodFinished: $method Result: $arguments")
                    contract.getTrackingResponse(Gson().fromJson(arguments, SdkResponse::class.java))
                }
                Constants.initSessionFinishedMethod -> {
                    Log.d("SDK_MANAGER","-----> onMethodFinished: $method Result: $arguments")
                    contract.getInitSessionResponse(Gson().fromJson(arguments, SdkResponse::class.java))
                }
                Constants.initOperationFinishedMethod -> {
                    Log.d("SDK_MANAGER","-----> onMethodFinished: $method Result: $arguments")
                    contract.getInitOperationResponse(Gson().fromJson(arguments, SdkResponse::class.java))
                }
                Constants.generateRawTemplateFinishedMethod -> {
                    Log.d("SDK_MANAGER","-----> onMethodFinished: $method Result: $arguments")
                    contract.generateRawTemplateResponse(arguments)
                }
                Constants.tokenizeFinishedMethod -> {
                    Log.d("SDK_MANAGER","-----> onMethodFinished: $method Result: $arguments")
                    contract.getTokenizedString(arguments)
                }
                Constants.closeSessionFinishedMethod -> {
                    Log.d("SDK_MANAGER","-----> onMethodFinished: $method Result: $arguments")
                    contract.getCloseSessionResponse(Gson().fromJson(arguments, SdkResponse::class.java))
                }
                Constants.customerTrackingFinishedMethod -> {
                    Log.d("SDK_MANAGER","-----> onMethodFinished: $method Result: $arguments")
                    contract.getSetCustomerIdResponse(Gson().fromJson(arguments, SdkResponse::class.java))
                }
                Constants.onboardingFinishedMethod -> {
                    Log.d("SDK_MANAGER","-----> onMethodFinished: $method Result: $arguments")
                    contract.getOnboardingResponse(Gson().fromJson(arguments, SdkResponse::class.java))
                }
                Constants.authenticationFinishedMethod -> {
                    Log.d("SDK_MANAGER","-----> onMethodFinished: $method Result: $arguments")
                    contract.getAuthenticationResponse(Gson().fromJson(arguments, SdkResponse::class.java))
                }
                else -> {
                    Log.d("SDK_MANAGER","-----> Else onMethodFinished: $method ")
                }
            }
        }

    }

    private val flutterManager: FlutterManager = FlutterManager(context, flutterContract)

    fun launchSelphi(selphiConfigurationData: SelphiConfigurationData) {
        if (!Utils.isNetworkAvailable(context)) {
            val response = SdkResponse()
            response.errorType = ErrorType.NETWORK_CONNECTION
            contract.getSelphiResponse(response)

        }else{
            flutterManager.launchSdk(initSelphiMethod, Gson().toJson(selphiConfigurationData))
        }

    }

    fun initSession(initSessionRequest: InitSessionRequest){
        val response = SdkResponse()
        if (initSessionRequest.sessionId.isNullOrEmpty()){
            contract.getInitSessionResponse(response)
        }else if (!Utils.isNetworkAvailable(context)) {
            response.errorType = ErrorType.NETWORK_CONNECTION
            contract.getInitSessionResponse(response)
        }
        else{
            flutterManager.launchSdk(initSessionMethod, Gson().toJson(initSessionRequest))
        }
    }

    fun initOperation(initOperationRequest: InitOperationRequest){
        val response = SdkResponse()
        if (initOperationRequest.operationId.isNullOrEmpty()||
            initOperationRequest.type.isNullOrEmpty()){
            contract.getInitOperationResponse(response)
        }else if (!Utils.isNetworkAvailable(context)){
            response.errorType = ErrorType.NETWORK_CONNECTION
            contract.getInitOperationResponse(response)
        }else{
            flutterManager.launchSdk(initOperationMethod, Gson().toJson(initOperationRequest))
        }
    }

    fun launchOnboarding(onboardingRequest: OnboardingRequest){
        val response = SdkResponse()
        if (onboardingRequest.operationId.isNullOrEmpty()){
            contract.getOnboardingResponse(response)
        } else if (!Utils.isNetworkAvailable(context)) {
            response.errorType = ErrorType.NETWORK_CONNECTION
            contract.getOnboardingResponse(response)

        }else if(onboardingRequest.selphIdConfigurationData.license.isNullOrEmpty()){
            response.errorType = ErrorType.TE_EXTRACTION_LICENSE_ERROR
            contract.getOnboardingResponse(response)
        }else{
            flutterManager.launchSdk(onboardingMethod, Gson().toJson(onboardingRequest))
        }

    }

    fun launchAuthentication(authenticationRequest: AuthenticationRequest){
        val response = SdkResponse()
        if (authenticationRequest.operationId.isNullOrEmpty()){
            contract.getAuthenticationResponse(response)
        } else if (!Utils.isNetworkAvailable(context)) {
            response.errorType = ErrorType.NETWORK_CONNECTION
            contract.getAuthenticationResponse(response)
        }else{
            flutterManager.launchSdk(authenticationMethod, Gson().toJson(authenticationRequest))
        }
    }

    fun launchSelphId(selphIdConfigurationData: SelphIdConfigurationData) {
        val response = SdkResponse()
        if(selphIdConfigurationData.license.isNullOrEmpty()){
            response.errorType = ErrorType.TE_EXTRACTION_LICENSE_ERROR
            contract.getSelphIdResponse(response)
        }else if (!Utils.isNetworkAvailable(context)){
            response.errorType = ErrorType.NETWORK_CONNECTION
            contract.getSelphIdResponse(response)
        }else{
            flutterManager.launchSdk(initSelphidMethod, Gson().toJson(selphIdConfigurationData))
        }

    }
    
    fun launchTracking(trackingData: TrackingData) {
        if (!Utils.isNetworkAvailable(context)){
            val response = SdkResponse()
            response.errorType = ErrorType.NETWORK_CONNECTION
            contract.getTrackingResponse(response)
        }else{
            flutterManager.launchSdk(trackingMethod, Gson().toJson(trackingData))
        }
    }

    fun setCustomerId(customerId: String) {
        if (!Utils.isNetworkAvailable(context)){
            val response = SdkResponse()
            response.errorType = ErrorType.NETWORK_CONNECTION
            contract.getSetCustomerIdResponse(response)
        }else{
            flutterManager.launchSdk(customerTrackingMethod, customerId)
        }
    }

    fun generateRawTemplate(base64: String) {
        if (base64.isNullOrEmpty()){
            contract.generateRawTemplateResponse("")
        }else{
            flutterManager.launchSdk(generateRawTemplateMethod, base64)
        }

    }

    fun tokenize(sessionId: String, operationId: String, operationType: OperationType) {
        if (sessionId.isNullOrEmpty() || operationId.isNullOrEmpty()){
            contract.getTokenizedString("")
        }else{
            val data = TokenizeData(sessionId, operationId, operationType.name)
            flutterManager.launchSdk(tokenizeMethod, Gson().toJson(data))
        }

    }

    fun closeSession() {
        /*if (!isNetworkAvailable()){
            val response = SdkResponse()
            response.errorType = ErrorType.NETWORK_CONNECTION
            contract.getCloseSessionResponse(response)
        }else{*/
        flutterManager.launchSdk(closeSessionMethod, "")
       // }
    }



}

package com.facephi.bridge_plugin.sdkmanager.data.response

data class SdkResponse(
    var  finishStatus : Int = FinishStatus.STATUS_ERROR,
    var  errorType : Int = ErrorType.TE_UNKNOWN_ERROR,
    var  trackingStatus : Int = FinishStatus.STATUS_OK,
    var  trackingErrorType : ArrayList<Int>? = arrayListOf(),
    var selphiResponse: SelphiResponse? = null,
    var selphIdResponse: SelphIdResponse? = null
)



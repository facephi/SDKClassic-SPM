package com.facephi.bridge_plugin.sdkmanager.data.response

class FinishStatus {
    companion object{
        const val STATUS_OK = 1
        const val STATUS_ERROR = 2
        const val STATUS_CANCEL_BY_USER = 3
        const val STATUS_TIMEOUT = 4
    }
}
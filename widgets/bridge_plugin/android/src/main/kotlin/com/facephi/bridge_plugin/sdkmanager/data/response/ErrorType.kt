package com.facephi.bridge_plugin.sdkmanager.data.response

class ErrorType {
    companion object{
        const val TRACK_EXTERNAL_EVENT_ERROR = -8
        const val TRACK_SELPHID_ERROR = -7
        const val TRACK_SELPHI_ERROR = -6
        const val TRACK_START_ERROR = -5
        const val TRACK_COORDINATES_ERROR = -4
        const val TRACK_DEVICE_ERROR = -3
        const val INIT_SESSION_ERROR = -2
        const val INIT_PROCESS_ERROR = -1
        const val NETWORK_CONNECTION = 0
        const val TE_UNKNOWN_ERROR = 1
        const val TE_NO_ERROR = 2
        const val TE_CAMERA_PERMISSION_DENIED = 3
        const val TE_SETTINGS_PERMISSION_ERROR = 4
        const val TE_HARDWARE_ERROR = 5
        const val TE_EXTRACTION_LICENSE_ERROR = 6
        const val TE_UNEXPECTED_CAPTURE_ERROR = 7
        const val TE_CONTROL_NOT_INITIALIZATED_ERROR = 8
        const val TE_BAD_EXTRACTOR_CONFIGURATION_ERROR = 9
    }
}
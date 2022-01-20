//
//  EnumsResponse.swift
//  ios
//
//  Created by Faustino Flores García on 10/12/21.
//

import Foundation

public enum FinishStatus: Int {
    case STATUS_OK = 1
    case STATUS_ERROR = 2
    case STATUS_CANCEL_BY_USER = 3
    case STATUS_TIMEOUT = 4
}

public enum OnboardingType: String {
    case ONBOARDING
    case AUTHENTICATION
}


public enum ErrorType: Int {
    case NETWORK_CONNECTION_ERROR = 0
    case TE_UNKNOWN_ERROR = 1
    case TE_NO_ERROR = 2
    case TE_CAMERA_PERMISSION_DENIED = 3
    case TE_SETTINGS_PERMISSION_ERROR = 4
    case TE_HARDWARE_ERROR = 5
    case TE_EXTRACTION_LICENSE_ERROR = 6
    case TE_UNEXPECTED_CAPTURE_ERROR = 7
    case TE_CONTROL_NOT_INITIALIZATED_ERROR = 8
    case TE_BAD_EXTRACTOR_CONFIGURATION_ERROR = 9
}

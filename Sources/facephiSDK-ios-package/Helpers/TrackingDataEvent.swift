//
//  TrackingDataEvent.swift
//  
//
//  Created by Faustino Flores García on 13/1/22.
//

import Foundation

public enum TrackingDataEvent: String {
    case SCREEN_ACCESS
    case CLICK_BUTTON
    case STATE
    case STATE_CHANGE
    case STEP_CHANGE
    case AUTHENTICATION_RESULT
    case EXPIRED_BY_SCHEDULERCLICK
    case SWIPE
    case LICENSE_ERROR
    case AUTO_CONFIGURE
    case WIDGET_EXCEPTION
    case FEATURE_NOT_SUPPORTED
    case RECORDING
    case RECORDING_FILE
    case RECORDING_ERROR
    case ONBOARDING_RESULT
}

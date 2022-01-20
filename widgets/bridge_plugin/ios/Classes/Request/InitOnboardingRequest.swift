//
//  InitOnboardingRequest.swift
//  
//
//  Created by Faustino Flores García on 20/12/21.
//

import Foundation

public struct InitOnboardingRequest: Encodable {
    var onboardingId: String
    var type : String
    
    public init(onboardingId: String, onboardingType:OnboardingType) {
        self.onboardingId = onboardingId
        self.type = onboardingType.rawValue
    }
}

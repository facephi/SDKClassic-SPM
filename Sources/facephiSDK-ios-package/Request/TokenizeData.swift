//
//  TokenizeData.swift
//
//
//  Created by Faustino Flores García on 19/1/22.
//

import Foundation

public struct TokenizeData: Codable {
    var sessionId = ""
    var operationId = ""
    var family = ProcessType.ONBOARDING.rawValue

    public init(sessionId: String, operationId: String, family: ProcessType) {
        self.sessionId = sessionId
        self.operationId = operationId
        self.family = family.rawValue
    }
}

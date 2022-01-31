//
//  InitSessionRequest.swift
//
//
//  Created by Faustino Flores García on 20/12/21.
//

import Foundation

public struct InitSessionRequest: Encodable {
    var sessionId: String
    var environment: String

    public init(sessionId: String, environment: Environment) {
        self.sessionId = sessionId
        self.environment = environment.rawValue
    }
}

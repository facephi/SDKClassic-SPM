//
//  InitSessionRequest.swift
//
//
//  Created by Faustino Flores García on 20/12/21.
//

import Foundation

public struct InitSessionRequest: Encodable {
    var sessionId: String
    var customerId: String
    
    public init(sessionId: String, customerId:String) {
        self.sessionId = sessionId
        self.customerId = customerId
    }
}

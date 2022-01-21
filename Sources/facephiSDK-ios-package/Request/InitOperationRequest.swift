//
//  InitOperationRequest.swift
//
//
//  Created by Faustino Flores García on 20/12/21.
//

import Foundation

public struct InitOperationRequest: Encodable {
    var operationId: String
    var type = ProcessType.ONBOARDING.rawValue

    public init(operationId: String, type: ProcessType) {
        self.operationId = operationId
        self.type = type.rawValue
    }
}

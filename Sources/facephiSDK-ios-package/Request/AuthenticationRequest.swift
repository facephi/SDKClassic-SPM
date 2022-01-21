//
//  File.swift
//
//
//  Created by Faustino Flores García on 19/1/22.
//

import Foundation

public class AuthenticationRequest: Encodable {
    var operationId: String = ""
    var customerId: String = ""
    var selphiConfigurationData = SelphiConfiguration()

    public init(operationId: String, customerId: String, selphiConfigurationData: SelphiConfiguration) {
        self.operationId = operationId
        self.customerId = customerId
        self.selphiConfigurationData = selphiConfigurationData
    }
}

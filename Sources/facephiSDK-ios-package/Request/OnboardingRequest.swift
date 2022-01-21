//
//  File.swift
//
//
//  Created by Faustino Flores García on 19/1/22.
//

import Foundation

public class OnboardingRequest: Codable {
    var operationId: String = ""
    var customerId: String = ""
    var selphiConfigurationData = SelphiConfiguration()
    var selphIdConfigurationData = SelphIdConfiguration()

    public init(operationId: String, customerId: String, selphiConfigurationData: SelphiConfiguration, selphIdConfigurationData: SelphIdConfiguration) {
        self.operationId = operationId
        self.customerId = customerId
        self.selphiConfigurationData = selphiConfigurationData
        self.selphIdConfigurationData = selphIdConfigurationData
    }
}

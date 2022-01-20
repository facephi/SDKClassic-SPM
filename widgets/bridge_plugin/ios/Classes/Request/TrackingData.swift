//
//  TrackingData.swift
//  ios
//
//  Created by Faustino Flores García on 1/12/21.
//

import Foundation

public struct TrackingData: Codable {
    var screen = ""
    var event = ""

   public init(screen: String, event: String) {
        self.screen = screen
        self.event = event
    }
    
}

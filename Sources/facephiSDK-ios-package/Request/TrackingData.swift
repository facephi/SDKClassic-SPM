//
//  TrackingData.swift
//  ios
//
//  Created by Faustino Flores García on 1/12/21.
//

import Foundation

public struct TrackingData: Codable {
    var screen = ""
    var event = TrackingDataEvent.SCREEN_ACCESS.rawValue

    public init(screen: String, event: TrackingDataEvent) {
        self.screen = screen
        self.event = event.rawValue
    }
}

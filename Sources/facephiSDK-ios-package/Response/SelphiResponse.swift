//
//  SelphiResponse.swift
//  ios
//
//  Created by Faustino Flores García on 9/12/21.
//

import Foundation

public struct SelphiResponse: Codable {
    var errorMessage:String? = ""
    var templateRaw = ""
    var eyeGlassesScore: Double = 0.0
    var templateScore: Double? = 0.0
    var qrData = ""
    var bestImage = ""
    var bestImageCropped = ""

    public init() {}
}

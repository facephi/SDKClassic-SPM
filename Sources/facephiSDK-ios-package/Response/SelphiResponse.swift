//
//  SelphiResponse.swift
//  ios
//
//  Created by Faustino Flores García on 9/12/21.
//

import Foundation

public struct SelphiResponse: Codable {
    var errorMessage: String? = ""
    var templateRaw: String? = ""
    var eyeGlassesScore: Double? = 0.0
    var templateScore: Double? = 0.0
    var qrData: String? = ""
    var bestImage: String? = ""
    var bestImageCropped: String? = ""

    public var shortDescription: String {
        guard let safeTemplateRaw = templateRaw else { return "" }

        return "SELPHI :\n templateRaw: \(safeTemplateRaw.prefix(20))..."
    }

    public init() {}
}

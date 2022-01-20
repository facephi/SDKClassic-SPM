//
//  SelphIdResponse.swift
//  ios
//
//  Created by Faustino Flores García on 9/12/21.
//

import Foundation

public struct SelphIdResponse: Codable {
    var finishStatusDescription = ""
    var documentData: [String: String]?

    var tokenBackDocument = ""
    var tokenFrontDocument = ""
    var tokenFaceImage = ""
    var tokenOCR = ""
    var documentCaptured: String?
    var matchingSidesScore: Float = 0.0
    var captureProgress = 0

    var tokenRawFrontDocument: String?
    var tokenRawBackDocument: String?
    var frontDocumentImage = ""
    var faceImage = ""

    var signatureImage: String?
    var backDocumentImage = ""
    var fingerprintImage: String?
    var rawFrontDocument: String?
    var rawBackDocument: String?

    enum CodingKeys: CodingKey {
        case finishStatusDescription
        case documentData
        case tokenBackDocument
        case tokenFrontDocument
        case tokenFaceImage
        case tokenOCR
        case documentCaptured
        case matchingSidesScore
        case captureProgress

        case tokenRawFrontDocument
        case tokenRawBackDocument
        case frontDocumentImage
        case faceImage

        case signatureImage
        case backDocumentImage
        case fingerprintImage
        case rawFrontDocument
        case rawBackDocument
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        finishStatusDescription = try values.decode(String.self, forKey: .finishStatusDescription)

        let documentDataJson = try values.decode(String.self, forKey: .documentData)
        documentData = documentDataJson.isEmpty ? nil : documentDataJson.toObject()

        tokenBackDocument = try values.decode(String.self, forKey: .tokenBackDocument)
        tokenFrontDocument = try values.decode(String.self, forKey: .tokenFrontDocument)
        tokenFaceImage = try values.decode(String.self, forKey: .tokenFaceImage)
        tokenOCR = try values.decode(String.self, forKey: .tokenOCR)
        documentCaptured = try values.decode(String.self, forKey: .documentCaptured)
        matchingSidesScore = try values.decode(Float.self, forKey: .matchingSidesScore)
        captureProgress = try values.decode(Int.self, forKey: .captureProgress)

        tokenRawFrontDocument = try? values.decode(String.self, forKey: .tokenRawFrontDocument)
        tokenRawBackDocument = try? values.decode(String.self, forKey: .tokenRawBackDocument)
        frontDocumentImage = try values.decode(String.self, forKey: .frontDocumentImage)
        faceImage = try values.decode(String.self, forKey: .faceImage)

        signatureImage = try? values.decode(String.self, forKey: .signatureImage)
        backDocumentImage = try values.decode(String.self, forKey: .backDocumentImage)
        fingerprintImage = try? values.decode(String.self, forKey: .fingerprintImage)
        rawFrontDocument = try? values.decode(String.self, forKey: .rawFrontDocument)
        rawBackDocument = try? values.decode(String.self, forKey: .rawBackDocument)
    }

    public init() {}
}

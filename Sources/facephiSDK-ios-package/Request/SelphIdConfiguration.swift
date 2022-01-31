//
//  SelphIdConfigurationData.swift
//  ios
//
//  Created by Faustino Flores García on 1/12/21.
//

import Foundation

public enum SelphIDDocumentType: String {
    case DT_IDCARD = "DT_IDCard"
    case DT_PASSPORT = "DT_Passport"
    case DT_DRIVERSLICENSE = "DT_DriversLicense"
    case DT_FOREIGNCARD = "DT_ForeignCard"
    case DT_CREDITCARD = "DT_CreditCard"
    case DT_CUSTOM = "DT_Custom"
}

public enum SelphIDTimeout: String {
    case T_SHORT = "Short"
    case T_MEDIUM = "Medium"
    case T_LONG = "Long"
}

public enum SelphIDScanMode: String {
    case CAP_MODE_GENERIC = "GenericMode"
    case CAP_MODE_SPECIFIC = "SpecificMode"
    case CAP_MODE_SEARCH = "SearchMode"
}

public enum SelphIDCompressFormat: String {
    case T_JPEG = "jpeg"
    case T_PNG = "png"
}

public struct SelphIdConfiguration: Codable {
    var debug = false
    var showResultAfterCapture = true
    var showTutorial = false
    var scanMode = SelphIDScanMode.CAP_MODE_SEARCH.rawValue
    var specificData = ""
    var fullscreen = true
    var tokenImageQuality = 0.5
    var locale = ""
    public var documentType = SelphIDDocumentType.DT_IDCARD.rawValue
    var timeout = SelphIDTimeout.T_SHORT.rawValue
    var enableWidgetEventListener = false
    var generateRawImages = false
    var compressFormat = SelphIDCompressFormat.T_JPEG.rawValue
    var imageQuality = 100
    var translationsContent = ""
    var viewsContent = ""
    var documentModels = ""
    public var license = ""

    public init(debug: Bool,
                showResultAfterCapture: Bool,
                showTutorial: Bool,
                scanMode: String,
                specificData: String,
                fullscreen: Bool,
                tokenImageQuality: Double,
                locale: String,
                documentType: String,
                timeout: String,
                enableWidgetEventListener: Bool,
                generateRawImages: Bool,
                compressFormat: String,
                imageQuality: Int,
                translationsContent: String,
                viewsContent: String,
                documentModels: String,
                license: String)
    {
        self.debug = debug
        self.showResultAfterCapture = showResultAfterCapture
        self.showTutorial = showTutorial
        self.scanMode = scanMode
        self.specificData = specificData
        self.fullscreen = fullscreen
        self.tokenImageQuality = tokenImageQuality
        self.locale = locale
        self.documentType = documentType
        self.timeout = timeout
        self.enableWidgetEventListener = enableWidgetEventListener
        self.generateRawImages = generateRawImages
        self.compressFormat = compressFormat
        self.imageQuality = imageQuality
        self.translationsContent = translationsContent
        self.viewsContent = viewsContent
        self.documentModels = documentModels
        self.license = license
    }

    public init() {}
}

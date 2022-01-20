//
//  SelphiFaceConfiguration.swift
//  ios
//
//  Created by Faustino Flores García on 30/11/21.
//

import Foundation

public enum SelphiFaceLivenessMode: String {
    case LM_PASSIVE = "PASSIVE"
    case LM_NONE = "NONE"
}

public struct SelphiConfiguration: Codable {
    var debug = false
    var fullscreen = true
    var crop = false
    var cropPercent = 1.0
    var sceneTimeout = 0.0
    var livenessMode = SelphiFaceLivenessMode.LM_PASSIVE.rawValue
    var jpgQuality = 0.95
    var qrValidatorExpression = ""
    var enableImages = false
    var uTags = ""
    var frontalCameraPreferred = true
    var locale = ""
    var stabilizationMode = false
    var templateRawOptimized = true
    var desiredCameraWidth = 0
    var desiredCameraHeight = 0
    var enableGenerateTemplateRaw = false
    var enableWidgetEventListener = false
    var qrMode = false
    var translationsContent = ""
    var viewsContent = ""

    public init(debug: Bool,
                fullscreen: Bool,
                crop: Bool,
                cropPercent: Double,
                sceneTimeout: Double,
                livenessMode: String,
                jpgQuality: Double,
                qrValidatorExpression: String,
                enableImages: Bool,
                uTags: String,
                frontalCameraPreferred: Bool,
                locale: String,
                stabilizationMode: Bool,
                templateRawOptimized: Bool,
                desiredCameraWidth: Int,
                desiredCameraHeight: Int,
                enableGenerateTemplateRaw: Bool,
                enableWidgetEventListener: Bool,
                qrMode: Bool,
                translationsContent: String,
                viewsContent: String)
    {
        self.debug = debug
        self.fullscreen = fullscreen
        self.locale = locale
        self.crop = crop
        self.cropPercent = cropPercent
        self.sceneTimeout = sceneTimeout
        self.enableImages = enableImages
        self.qrValidatorExpression = qrValidatorExpression
        self.livenessMode = livenessMode
        self.uTags = uTags
        self.jpgQuality = jpgQuality
        self.frontalCameraPreferred = frontalCameraPreferred
        self.stabilizationMode = stabilizationMode
        self.templateRawOptimized = templateRawOptimized
        self.desiredCameraWidth = desiredCameraWidth
        self.desiredCameraHeight = desiredCameraHeight
        self.enableGenerateTemplateRaw = enableGenerateTemplateRaw
        self.enableWidgetEventListener = enableWidgetEventListener
        self.qrMode = qrMode
        self.translationsContent = translationsContent
        self.viewsContent = viewsContent
    }

    public init() {}
}

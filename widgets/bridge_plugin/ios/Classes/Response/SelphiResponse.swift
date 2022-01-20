//
//  SelphiResponse.swift
//  ios
//
//  Created by Faustino Flores García on 9/12/21.
//

import Foundation

public struct SelphiResponse: Codable {
    public var finishStatus = FinishStatus.STATUS_ERROR.rawValue
    public var errorDiagnostic = ErrorType.TE_UNKNOWN_ERROR.rawValue
    var errorMessage = ""
    var templateRaw = ""
    var eyeGlassesScore: Double = 0.0
    var templateScore: Double?
    var qrData = ""
    var bestImage = ""
    var bestImageCropped = ""
    
    public init(){
        
    }
    
    init(with errorDiagnostic:Int){
        self.errorDiagnostic = errorDiagnostic
    }
}

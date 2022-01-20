//
//  SdkResponse.swift
//  
//
//  Created by Faustino Flores García on 15/12/21.
//

import Foundation

public struct SdkResponse: Codable {
    public var finishStatus = FinishStatus.STATUS_ERROR.rawValue
    public var errorType : Int? = ErrorType.TE_UNKNOWN_ERROR.rawValue
    
    init(with errorType:Int){
        self.errorType = errorType
    }
}

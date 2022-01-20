//
//  SdkResponse.swift
//
//
//  Created by Faustino Flores García on 15/12/21.
//

import Foundation

public struct SdkResponse: Codable {
    public var finishStatus = FinishStatus.STATUS_ERROR.rawValue
    public var errorType = ErrorType.TE_UNKNOWN_ERROR.rawValue
    public var trackingStatus:Int? = FinishStatus.STATUS_OK.rawValue
    public var trackingErrorType:[Int]? = [Int]()
    public var selphiResponse: SelphiResponse? = nil
    public var selphIdResponse: SelphIdResponse? = nil

    public init(withErrorType: Int) {
        self.errorType = withErrorType
    }

    public init(withFinishStatus: Int) {
        self.finishStatus = withFinishStatus
    }

    public init() {}
}

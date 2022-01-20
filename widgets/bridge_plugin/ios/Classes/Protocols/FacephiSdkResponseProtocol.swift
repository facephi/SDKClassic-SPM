//
//  FacephiSdkProtocol.swift
//  ios
//
//  Created by Faustino Flores García on 9/12/21.
//

import Foundation

public protocol FacephiSdkResponseProtocol {
    func getInitSessionResponse(_ response: SdkResponse)
    func getInitOnboardingProcessResponse(_ response: SdkResponse)
    func getSelphiResponse(_ response: SelphiResponse)
    func getSelphIdResponse(_ response: SelphidResponse)
    func getTrackingResponse(_ response: SdkResponse)
    func getGenerateRawTemplateResponse(_ response: String)
    func getCloseSessionResponse(_ response: SdkResponse)
    func getTokenizedString(_ response: String)
}

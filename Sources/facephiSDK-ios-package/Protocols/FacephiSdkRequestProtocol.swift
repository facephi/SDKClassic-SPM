//
//  FacephiSdkRequestProtocol.swift
//
//
//  Created by Faustino Flores García on 24/12/21.
//

import Foundation
import UIKit

public protocol FacephiSdkRequestProtocol: AnyObject {
    var delegate: FacephiSdkResponseProtocol? { get set }
    func initSession(withRequest request: InitSessionRequest)
    func initOperation(withRequest request: InitOperationRequest)
    func launchOnboarding(withRequest request: OnboardingRequest)
    func launchAuthentication(withRequest request: AuthenticationRequest)
    func launchSelphi(_ configuration: SelphiConfiguration)
    func launchSelphId(_ configuration: SelphIdConfiguration)
    func launchTracking(_ trackingData: TrackingData)
    func generateRawTemplate(imageBase64: String)
    func closeSession()
    func tokenize(_ tokenizeData: TokenizeData)
    func setCustomerId(_ customerId: String)
}

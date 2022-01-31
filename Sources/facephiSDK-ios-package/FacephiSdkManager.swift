import UIKit

open class FacephiSdkManager {
    // MARK: - Public Properties
    public var delegate: FacephiSdkResponseProtocol? {
        didSet {
            if let safeDelegate = delegate {
                methodsFactory.createMethods(delegate: safeDelegate)
            }
        }
    }

    public var channel: ChannelProtocol! {
        didSet {
            methodsFactory = MethodsFactory(channel: channel)
        }
    }

    // MARK: - Private Properties
    private var methodsFactory: MethodsFactory!

    // MARK: - INIT
    public init() {
        defer {
            channel = FlutterChannel(networkStatusProvider: NetworkStatus(), delegate: self)
        }
    }

    // MARK: - PRIVATE FUNC
    private func invoke(method: String, args: String?, checkNetwork: Bool = true) {
        if let method = methodsFactory.getMethodChannel(byInvokeMethodName: method) {
            invoke(method: method, args: args, checkNetwork: checkNetwork)
        }
    }

    private func invoke(method: MethodChannel, args: String?, checkNetwork: Bool = true) {
        if let invokeMethodName = method.invokeMethodName, let handler = method.invokeMethodHandler {
            handler(invokeMethodName, method.responseMethodName, args, checkNetwork)
        }
    }
}

extension FacephiSdkManager: FacephiSdkRequestProtocol {
    public func setCustomerId(_ customerId: String) {
        invoke(method: MethodsFactory.InitMethodName.customerTracking.rawValue, args: customerId)
    }

    public func tokenize(_ tokenizeData: TokenizeData) {
        if let method = methodsFactory.getMethodChannel(byInvokeMethodName: MethodsFactory.InitMethodName.tokenize.rawValue) {
            if tokenizeData.sessionId.isEmpty || tokenizeData.operationId.isEmpty {
                method.errorResponseMethodHandler?(ErrorType.TE_UNKNOWN_ERROR.rawValue)
            }
            else {
                invoke(method: method, args: tokenizeData.json, checkNetwork: false)
            }
        }
    }

    public func initSession(withRequest request: InitSessionRequest) {
        if let method = methodsFactory.getMethodChannel(byInvokeMethodName: MethodsFactory.InitMethodName.initSession.rawValue) {
            if request.sessionId.isEmpty {
                method.errorResponseMethodHandler?(ErrorType.TE_UNKNOWN_ERROR.rawValue)
            }
            else {
                invoke(method: method, args: request.json)
            }
        }
    }

    public func initOperation(withRequest request: InitOperationRequest) {
        if let method = methodsFactory.getMethodChannel(byInvokeMethodName: MethodsFactory.InitMethodName.initOperation.rawValue) {
            if request.operationId.isEmpty {
                method.errorResponseMethodHandler?(ErrorType.TE_UNKNOWN_ERROR.rawValue)
            }
            else {
                invoke(method: method, args: request.json)
            }
        }
    }

    public func launchOnboarding(withRequest request: OnboardingRequest) {
        invoke(method: MethodsFactory.InitMethodName.onboarding.rawValue, args: request.json)
    }

    public func launchAuthentication(withRequest request: AuthenticationRequest) {
        invoke(method: MethodsFactory.InitMethodName.authentication.rawValue, args: request.json)
    }

    public func launchSelphi(_ configuration: SelphiConfiguration) {
        invoke(method: MethodsFactory.InitMethodName.initSelphi.rawValue, args: configuration.json)
    }

    public func launchSelphId(_ configuration: SelphIdConfiguration) {
        if let method = methodsFactory.getMethodChannel(byInvokeMethodName: MethodsFactory.InitMethodName.initSelphid.rawValue) {
            if configuration.license.isEmpty {
                method.errorResponseMethodHandler?(ErrorType.TE_EXTRACTION_LICENSE_ERROR.rawValue)
            }
            else {
                invoke(method: method, args: configuration.json)
            }
        }
    }

    public func launchTracking(_ trackingData: TrackingData) {
        invoke(method: MethodsFactory.InitMethodName.addTracking.rawValue, args: trackingData.json)
    }

    public func generateRawTemplate(imageBase64: String) {
        if let method = methodsFactory.getMethodChannel(byInvokeMethodName: MethodsFactory.InitMethodName.generateRawTemplate.rawValue) {
            if imageBase64.isEmpty {
                method.errorResponseMethodHandler?(ErrorType.TE_UNKNOWN_ERROR.rawValue)
            }
            else {
                invoke(method: method, args: imageBase64.json, checkNetwork: false)
            }
        }
    }

    public func closeSession() {
        invoke(method: MethodsFactory.InitMethodName.closeSessionMethod.rawValue, args: "", checkNetwork: false)
    }
}

extension FacephiSdkManager: ChannelResponseProtocol {
    public func handlerChannelResponse(method: String, arguments: String) {
        if let method = methodsFactory.getMethodChannel(byResponseMethodName: method) {
            method.responseMethodHandler(arguments)
        }
    }

    public func handlerChannelErrorResponse(method: String, errorArguments: Int) {
        if let method = methodsFactory.getMethodChannel(byResponseMethodName: method) {
            method.errorResponseMethodHandler?(errorArguments)
        }
    }
}

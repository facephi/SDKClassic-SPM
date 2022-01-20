import UIKit

public class FacephiSdkManager {
    // MARK: - Public Properties
    public var delegate: FacephiSdkResponseProtocol? {
        didSet {
            if let safeDelegate = delegate {
                methodsFactory.createMethods(delegate: safeDelegate)
            }
        }
    }

    // MARK: - Private Properties
    private var channel: ChannelProtocol!
    private var methodsFactory: MethodsFactory!

    // MARK: - INIT
    public init() {
        channel = FlutterChannel(networkStatusProvider: NetworkStatus(), delegate: self)
        methodsFactory = MethodsFactory(channel: channel)
    }

    // MARK: - PRIVATE FUNC
    private func invoke(method: String, args: String?, checkNetwork: Bool = true) {
        if let method = methodsFactory.getMethodChannel(byInvokeMethodName: method) {
            method.invokeMethodHandler(method.invokeMethodName, args, checkNetwork)
        }
    }
}

extension FacephiSdkManager: FacephiSdkRequestProtocol {
    public func setCustomerId(_ customerId: String) {
        invoke(method: MethodsFactory.InitMethodName.customerTracking.rawValue, args: customerId)
    }

    public func tokenize(_ data: String) {
        invoke(method: MethodsFactory.InitMethodName.tokenize.rawValue, args: data)
    }

    public func initSession(withRequest request: InitSessionRequest) {
        invoke(method: MethodsFactory.InitMethodName.initSession.rawValue, args: request.json)
    }

    public func initProcess(withRequest request: InitProcessRequest) {
        invoke(method: MethodsFactory.InitMethodName.initOnboardingProcess.rawValue, args: request.json)
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
                method.invokeMethodHandler(method.invokeMethodName, configuration.json, true)
            }
        }
    }

    public func launchTracking(_ trackingData: TrackingData) {
        invoke(method: MethodsFactory.InitMethodName.addTracking.rawValue, args: trackingData.json)
    }

    public func generateRawTemplate(imageBase64: String) {
        invoke(method: MethodsFactory.InitMethodName.generateRawTemplate.rawValue, args: imageBase64.json, checkNetwork: false)
    }

    public func closeSession() {
        invoke(method: MethodsFactory.InitMethodName.closeSessionMethod.rawValue, args: "", checkNetwork: false)
    }
}

extension FacephiSdkManager: ChannelResponseProtocol {
    func handlerChannelResponse(method: String, arguments: String) {
        if let method = methodsFactory.getMethodChannel(byResponseMethodName: method) {
            method.responseMethodHandler(arguments)
        }
    }

    func handlerChannelErrorResponse(method: String, errorArguments: Int) {
        if let method = methodsFactory.getMethodChannel(byInvokeMethodName: method) {
            method.errorResponseMethodHandler?(errorArguments)
        }
    }
}

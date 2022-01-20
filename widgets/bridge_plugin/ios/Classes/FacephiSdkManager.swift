import UIKit

public class FacephiSdkManager {

    // MARK: - Public Properties
    //public static let shared = FacephiSdkManager()
    public var delegate: FacephiSdkResponseProtocol? {
        didSet {
            if let safeDelegate = delegate {
                methods = MethodChannel.methods(delegate: safeDelegate, channel: channel)
            }
        }
    }

    // MARK: - Private Properties
    private var channel: ChannelProtocol!
    private var methods: [MethodChannel]!

    // MARK: - INIT
    //private init() {
    public init() {
        channel = FlutterChannel(networkStatusProvider: NetworkStatus(), delegate: self)
    }

    // MARK: - PRIVATE FUNC
    private func invoke(method: String, args: String?, checkNetwork: Bool = true) {
        if let method = MethodChannel.getMethodChannel(byInvokeMethodName: method, methods: methods) {
            method.invokeMethodHandler(method.invokeMethodName, args, checkNetwork)
        }
    }
}

extension FacephiSdkManager: FacephiSdkRequestProtocol {
    public func tokenize(_ data: String) {
        invoke(method: MethodChannel.InitMethodName.tokenize.rawValue, args: data)

    }
    
    public func initSession(withRequest request: InitSessionRequest) {
        invoke(method: MethodChannel.InitMethodName.initSession.rawValue, args: request.json)
    }

    public func initOnboardingProcess(withRequest request: InitOnboardingRequest) {
        invoke(method: MethodChannel.InitMethodName.initOnboardingProcess.rawValue, args: request.json)
    }

    public func launchSelphi(_ configuration: SelphiConfiguration) {
        invoke(method: MethodChannel.InitMethodName.initSelphi.rawValue, args: configuration.json)
    }

    public func launchSelphId(_ configuration: SelphIdConfiguration) {
        if let method = MethodChannel.getMethodChannel(byInvokeMethodName: MethodChannel.InitMethodName.initSelphid.rawValue, methods: methods) {
            if configuration.license.isEmpty {
                method.errorResponseMethodHandler?(ErrorType.TE_EXTRACTION_LICENSE_ERROR.rawValue)
            } else {
                method.invokeMethodHandler(method.invokeMethodName, configuration.json, true)
            }
        }
    }

    public func launchTracking(_ trackingData: TrackingData) {
        invoke(method: MethodChannel.InitMethodName.addTracking.rawValue, args: trackingData.json)
    }

    public func generateRawTemplate(imageBase64: String) {
        invoke(method: MethodChannel.InitMethodName.generateRawTemplate.rawValue, args: imageBase64.json, checkNetwork: false)
    }

    public func closeSession() {
        invoke(method: MethodChannel.InitMethodName.closeSessionMethod.rawValue, args: "", checkNetwork: false)
    }
}

extension FacephiSdkManager: ChannelResponseProtocol {
    func handlerChannelResponse(method: String, arguments: String) {
        if let method = MethodChannel.getMethodChannel(byResponseMethodName: method, methods: methods) {
            method.responseMethodHandler(arguments)
        }
    }

    func handlerChannelErrorResponse(method: String, errorArguments: Int) {
        if let method = MethodChannel.getMethodChannel(byInvokeMethodName: method, methods: methods) {
            method.errorResponseMethodHandler?(errorArguments)
        }
    }
}

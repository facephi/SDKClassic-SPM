typealias invokeMethodType = (_ methodName: String, _ args: String?, _ checkNetwork: Bool) -> Void
typealias responseMethodType = (_ args: String) -> Void
typealias errorResponseMethodType = (_ args: Int) -> Void

struct MethodChannel {
    // MARK: - Enum
    enum InitMethodName: String {
        case initSession
        case initOnboardingProcess
        case initSelphi
        case initSelphid
        case addTracking
        case generateRawTemplate
        case closeSessionMethod
        case tokenize
    }

    enum FinishMethodName: String {
        case initSessionFinished
        case initOnboardingProcessFinished
        case selphiFinished
        case selphidFinished
        case trackingFinished
        case generateRawTemplateFinished
        case closeSessionFinishedMethod
        case tokenizeFinished
    }

    // MARK: - VARS
    var invokeMethodName: String
    var responseMethodName: String
    var invokeMethodHandler: invokeMethodType
    var responseMethodHandler: responseMethodType
    var errorResponseMethodHandler: errorResponseMethodType?

    // MARK: - INIT
    init(_ invokeMethodName: String, _ responseMethodName: String, _ invokeMethodHandler: @escaping invokeMethodType, _ responseMethodHandler: @escaping responseMethodType, _ errorResponseMethodHandler: errorResponseMethodType?) {
        self.invokeMethodName = invokeMethodName
        self.responseMethodName = responseMethodName
        self.invokeMethodHandler = invokeMethodHandler
        self.responseMethodHandler = responseMethodHandler
        self.errorResponseMethodHandler = errorResponseMethodHandler
    }

    // MARK: - STATIC
    static func getMethodChannel(byInvokeMethodName: String, methods: [MethodChannel]) -> MethodChannel? {
        return methods.first(where: { $0.invokeMethodName == byInvokeMethodName })
    }

    static func getMethodChannel(byResponseMethodName: String, methods: [MethodChannel]) -> MethodChannel? {
        return methods.first(where: { $0.responseMethodName == byResponseMethodName })
    }

    static func methods(delegate: FacephiSdkResponseProtocol, channel: ChannelProtocol) -> [MethodChannel] {
        var result = [MethodChannel]()

        let methodSession = MethodChannel(InitMethodName.initSession.rawValue, FinishMethodName.initSessionFinished.rawValue, channel.invoke, { args in
            if let response: SdkResponse = args.toObject() {
                delegate.getInitSessionResponse(response)
            }
        }, { args in
            delegate.getInitSessionResponse(SdkResponse(with: args))
        })
        result.append(methodSession)

        let methodOnboarding = MethodChannel(InitMethodName.initOnboardingProcess.rawValue, FinishMethodName.initOnboardingProcessFinished.rawValue, channel.invoke, { args in
            if let response: SdkResponse = args.toObject() {
                delegate.getInitOnboardingProcessResponse(response)
            }
        }, { args in
            delegate.getInitOnboardingProcessResponse(SdkResponse(with: args))
        })
        result.append(methodOnboarding)

        let methodSelphi = MethodChannel(InitMethodName.initSelphi.rawValue, FinishMethodName.selphiFinished.rawValue, channel.invoke, { args in
            if let response: SelphiResponse = args.toObject() {
                delegate.getSelphiResponse(response)
            }
        }, { args in
            delegate.getSelphiResponse(SelphiResponse(with: args))
        })
        result.append(methodSelphi)

        let methodSelphid = MethodChannel(InitMethodName.initSelphid.rawValue, FinishMethodName.selphidFinished.rawValue, channel.invoke, { args in
            if let response: SelphidResponse = args.toObject() {
                delegate.getSelphIdResponse(response)
            }
        }, { args in
            delegate.getSelphIdResponse(SelphidResponse(with: args))
        })
        result.append(methodSelphid)

        let methodTracking = MethodChannel(InitMethodName.addTracking.rawValue, FinishMethodName.trackingFinished.rawValue, channel.invoke, { args in
            if let response: SdkResponse = args.toObject() {
                delegate.getTrackingResponse(response)
            }
        }, { args in
            delegate.getTrackingResponse(SdkResponse(with: args))
        })
        result.append(methodTracking)

        let methodRawTemplate = MethodChannel(InitMethodName.generateRawTemplate.rawValue, FinishMethodName.generateRawTemplateFinished.rawValue, channel.invoke, { args in
            delegate.getGenerateRawTemplateResponse(args)
        }, nil)
        result.append(methodRawTemplate)

        let methodCloseSession = MethodChannel(InitMethodName.closeSessionMethod.rawValue, FinishMethodName.closeSessionFinishedMethod.rawValue, channel.invoke, { args in
            if let response: SdkResponse = args.toObject() {
                delegate.getCloseSessionResponse(response)
            }
        }, { args in
            delegate.getCloseSessionResponse(SdkResponse(with: args))
        })
        result.append(methodCloseSession)
        
        let methodTokenize = MethodChannel(InitMethodName.tokenize.rawValue, FinishMethodName.tokenizeFinished.rawValue, channel.invoke, { args in
            delegate.getTokenizedString(args)
        }, nil)
        result.append(methodTokenize)

        return result
    }
}

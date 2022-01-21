import Flutter
import FlutterPluginRegistrant

class FlutterChannel {
    // MARK: - PROPS
    internal let channelName = "onboarding.facephi.com/channel"
    internal let engineName = "onboarding.facephi.com/engine"
    internal var networkStatusProvider: NetworkStatusProviderProtocol!
    internal var delegate: ChannelResponseProtocol!

    private lazy var engine: FlutterEngine = {
        let result = FlutterEngine(name: engineName)
        // This could be `run` earlier in the app to avoid the overhead of doing it the first time the
        // engine is needed.
        // result.run()
        result.run(withEntrypoint: nil)
        GeneratedPluginRegistrant.register(with: result)
        return result
    }()

    private lazy var methodChannel: FlutterMethodChannel = {
        let result = FlutterMethodChannel(name: channelName, binaryMessenger: engine.binaryMessenger)
        return result
    }()

    // MARK: - INIT
    init(networkStatusProvider: NetworkStatusProviderProtocol, delegate: ChannelResponseProtocol) {
        self.networkStatusProvider = networkStatusProvider
        self.delegate = delegate

        setupMethodChannelResponse()
    }

    // MARK: - PRIVATE FUNC
    private func setupMethodChannelResponse() {
        methodChannel.setMethodCallHandler { [weak self]
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in

            guard let jsonString = call.arguments as? String else {
                result("Invalid response arguments")
                return
            }

            self?.delegate.handlerChannelResponse(method: call.method, arguments: jsonString)
        }
    }
}

// MARK: - ChannelProtocol
extension FlutterChannel: ChannelProtocol {
    func invoke(method: String, withArguments arguments: String?, andCheckNetwork checkNetwork: Bool = true) {
        if checkNetwork, !networkStatusProvider.isNetworkAvailable {
            delegate.handlerChannelErrorResponse(method: method, errorArguments: ErrorType.NETWORK_CONNECTION.rawValue)
        } else {
            DispatchQueue.main.async { [weak self] in
                self?.methodChannel.invokeMethod(method, arguments: arguments, result: nil)
            }
        }
    }

}

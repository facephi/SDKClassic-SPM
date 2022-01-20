typealias invokeMethodType = (_ methodName: String, _ args: String?, _ checkNetwork: Bool) -> Void
typealias responseMethodType = (_ args: String) -> Void
typealias errorResponseMethodType = (_ args: Int) -> Void

struct MethodChannel {
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
}

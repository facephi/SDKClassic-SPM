public typealias invokeMethodType = (_ methodName: String, _ responseMethodName: String, _ args: String?, _ checkNetwork: Bool) -> Void
public typealias responseMethodType = (_ args: String) -> Void
public typealias errorResponseMethodType = (_ args: Int) -> Void

public struct MethodChannel {
    // MARK: - VARS
    public var invokeMethodName: String?
    public var responseMethodName: String
    public var invokeMethodHandler: invokeMethodType?
    public var responseMethodHandler: responseMethodType
    public var errorResponseMethodHandler: errorResponseMethodType?

    // MARK: - INIT
    init(_ invokeMethodName: String?, _ responseMethodName: String, _ invokeMethodHandler: invokeMethodType?, _ responseMethodHandler: @escaping responseMethodType, _ errorResponseMethodHandler: errorResponseMethodType?) {
        self.invokeMethodName = invokeMethodName
        self.responseMethodName = responseMethodName
        self.invokeMethodHandler = invokeMethodHandler
        self.responseMethodHandler = responseMethodHandler
        self.errorResponseMethodHandler = errorResponseMethodHandler
    }
}

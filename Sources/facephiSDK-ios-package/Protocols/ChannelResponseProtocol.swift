protocol ChannelResponseProtocol {
    func handlerChannelResponse(method: String, arguments: String)
    func handlerChannelErrorResponse(method: String, errorArguments: Int)
}

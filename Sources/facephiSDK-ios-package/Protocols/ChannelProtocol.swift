import UIKit

public protocol ChannelProtocol {
    func invoke(method: String, responseMethod: String, withArguments arguments: String?, andCheckNetwork checkNetwork: Bool)
    var channelName: String { get }
    var networkStatusProvider: NetworkStatusProviderProtocol! { get }
    var delegate: ChannelResponseProtocol! { get }
}

import UIKit

protocol ChannelProtocol {
    func invoke(method: String, withArguments arguments: String?, andCheckNetwork checkNetwork: Bool)
    var channelName: String { get }
    var networkStatusProvider: NetworkStatusProviderProtocol! { get }
    var delegate: ChannelResponseProtocol! { get }
}

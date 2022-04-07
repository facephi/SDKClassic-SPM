//
//  SdkManager.swift
//
//
//  Created by Faustino Flores García on 2/2/22.
//

import bridge_plugin
import FlutterPluginRegistrant

open class SdkManager: FacephiSdkManager {
    var flutterViewController: FlutterViewController?

    public init(channel: ChannelProtocol? = nil) {
        if let safeChannel = channel {
            super.init(withChannel: safeChannel)
        }
        else {
            let engine = CustomEngine.DEFAULT.value
            GeneratedPluginRegistrant.register(with: engine)
            let channel = FlutterChannel(networkStatusProvider: NetworkStatus(), engine: engine)
            
            super.init(withChannel: channel)
        }
    }
}

//
//  InitProcessRequest.swift
//  
//
//  Created by Faustino Flores García on 20/12/21.
//

import Foundation

public struct InitProcessRequest: Encodable {
    var id: String
    var type : String
    
    public init(id: String, type:ProcessType) {
        self.id = id
        self.type = type.rawValue
    }
}

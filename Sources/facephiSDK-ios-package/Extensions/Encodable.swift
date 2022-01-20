//
//  Encodable.swift
//  
//
//  Created by Faustino Flores García on 15/12/21.
//

import Foundation

extension Encodable {
    public var json: String? {
        guard let jsonData = try? JSONEncoder().encode(self) else { return nil }
        let json = String(data: jsonData, encoding: .utf8)
        return json
    }
}

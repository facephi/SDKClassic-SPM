//
//  String.swift
//
//
//  Created by Faustino Flores García on 15/12/21.
//

import Foundation

extension String {
    func toObject<T: Decodable>() -> T? {
        guard let jsonData = data(using: .utf8) else { return nil }
        do {
            let result = try JSONDecoder().decode(T.self, from: jsonData)
            return result
        } catch {
            print("DECODE ERROR: \(error)")
            return nil
        }
    }
}

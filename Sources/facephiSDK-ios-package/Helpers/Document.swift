//
//  Document.swift
//
//
//  Created by Faustino Flores García on 28/1/22.
//

import Foundation

public enum Document: String, CaseIterable {
    case ID
    case DRIVER
    case PASSPORT

    public var documentType: SelphIDDocumentType {
        switch self {
        case .ID: return SelphIDDocumentType.DT_IDCARD
        case .DRIVER: return SelphIDDocumentType.DT_DRIVERSLICENSE
        case .PASSPORT: return SelphIDDocumentType.DT_PASSPORT
        }
    }
}

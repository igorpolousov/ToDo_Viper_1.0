//
//  ErrorHandler.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 08.10.2025.
//

import Foundation

enum ErrorHandler: Error {
    
    case missingData
    case networkError
    case unknownError(error: Error)
    
}

extension ErrorHandler: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return "Missing valid data"
        case .networkError:
            return "Network Error"
        case .unknownError(error: let error):
            return "Unxpected error: \(error.localizedDescription)"
        
        }
    }
}

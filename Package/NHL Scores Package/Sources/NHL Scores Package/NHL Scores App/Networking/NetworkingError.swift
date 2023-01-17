//
//  File.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import Foundation

enum NetworkingError: Error {
    case invalidUrl
    case connectionError
    case invalidResponse
    case invalidData
}

extension NetworkingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "The request URL was invalid"
        case .connectionError:
            return "Bad internet connection"
        case .invalidResponse:
            return "Invalid response from the server"
        case .invalidData:
            return "Invalid Data"
        }
    }
}

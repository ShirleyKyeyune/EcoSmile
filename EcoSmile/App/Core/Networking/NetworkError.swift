//
//  NetworkError.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case invalidRequest
    case decodeInvalidData
    case unexpectedStatusCode (Int)
    case networkFailure (Error)
    case unknown

    public var customMessage: String {
        switch self {
        case .invalidURL:
            return "Invalid URL Error"
        case .invalidResponse:
            return "Invalid response data. Failed to Parse!"
        case .invalidData:
            return "Invalid data"
        case .invalidRequest:
            return "Invalid Request"
        case .decodeInvalidData:
            return "Data decoding error"
        case .unexpectedStatusCode(let statusCode):
            return "Unexpected Status Error Code \(statusCode)"
        case .networkFailure(let error):
            return "Unexpected Status Error Code \(error.localizedDescription)"
        default:
            return "Unknown Error"
        }
    }
}

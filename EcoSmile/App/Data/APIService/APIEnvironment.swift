//
//  APIEnvironment.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

enum APIEnvironment {
    case local
    case production

    var scheme: String {
        switch self {
        case .local:
            return "http"
        case .production:
            return "https"
        }
    }

    var host: String {
        switch self {
        case .local:
            return "localhost:8080"
        case .production:
            return "pokeapi.co"
        }
    }
}

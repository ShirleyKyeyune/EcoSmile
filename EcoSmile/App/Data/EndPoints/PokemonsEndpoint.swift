//
//  PokemonsEndpoint.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

class PokemonsEndpoint: BaseEndpoint {
    let nextPageUrl: String?

    init(environment: APIEnvironment = .production, nextPageUrl: String? = nil) {
        self.nextPageUrl = nextPageUrl
        super.init(environment: environment)
    }

    override var queryParams: [String: String]? {
        guard let nextPageUrl,
              let url = URL(string: nextPageUrl),
              let queryParams = url.queryParameters
        else {
            return nil
        }

        return queryParams
    }
}

//
//  PokemonDetailsEndpoint.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

class PokemonDetailsEndpoint: BaseEndpoint {
    let pokemonId: Int

    private var basePath: String {
        super.pathTemplate
    }

    init(environment: APIEnvironment = .production, pokemonId: Int) {
        self.pokemonId = pokemonId
        super.init(environment: environment)
    }

    override var pathTemplate: String {
        "\(basePath)/{id}"
    }

    override var pathParams: [String: String]? {
        ["id": String(pokemonId)]
    }
}

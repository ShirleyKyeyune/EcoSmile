//
//  PokemonAPIService.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

struct PokemonAPIService: APIService {
    let networkService: Networkable

    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }

    func fetchPage(nextPageUrl: String?) async throws -> PokemonListDTO {
        let endpoint = PokemonsEndpoint(nextPageUrl: nextPageUrl)
        return try await networkService.sendRequest(endpoint: endpoint)
    }

    func fetchDetails(id: Int) async throws -> PokemonDetailDTO {
        let endpoint = PokemonDetailsEndpoint(pokemonId: id)
        return try await networkService.sendRequest(endpoint: endpoint)
    }
}

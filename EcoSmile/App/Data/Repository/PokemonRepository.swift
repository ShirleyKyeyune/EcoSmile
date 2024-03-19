//
//  PokemonRepository.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

struct PokemonRepository: RepositoryType {
    private let apiService: APIService

    init(apiService: APIService = PokemonAPIService()) {
        self.apiService = apiService
    }

    func fetchPage(nextPageUrl: String?) async throws -> PokemonPage {
        let data = try await apiService.fetchPage(nextPageUrl: nextPageUrl)
        return data.toDomain()
    }

    func fetchDetails(id: Int) async throws -> PokemonDetail {
        let data = try await apiService.fetchDetails(id: id)
        return data.toDomain()
    }
}

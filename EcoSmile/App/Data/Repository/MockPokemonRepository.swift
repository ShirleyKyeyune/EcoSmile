//
//  MockPokemonRepository.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

struct MockPokemonRepository: RepositoryType {
    func fetchPage(nextPageUrl: String?) async throws -> PokemonPage {
        // Load JSON data from a local file for the page
        guard let url = Bundle.main.url(forResource: "SamplePokemons", withExtension: "json") else {
            throw NSError(domain: "MockPokemonRepository", code: 404, userInfo: [NSLocalizedDescriptionKey: "JSON file not found"])
        }

        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let pokemonListDTO = try decoder.decode(PokemonListDTO.self, from: data)
        return pokemonListDTO.toDomain()
    }

    func fetchDetails(id: Int) async throws -> PokemonDetail {
        // Load JSON data from a local file for the details
        guard let url = Bundle.main.url(forResource: "PokemonDetail_\(id)", withExtension: "json") else {
            throw NSError(domain: "MockPokemonRepository", code: 404, userInfo: [NSLocalizedDescriptionKey: "JSON file not found"])
        }

        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let pokemonDetailDTO = try decoder.decode(PokemonDetailDTO.self, from: data)
        return pokemonDetailDTO.toDomain()
    }
}

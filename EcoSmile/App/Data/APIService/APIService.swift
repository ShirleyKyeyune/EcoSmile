//
//  APIService.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

protocol APIService {
    func fetchPage(nextPageUrl: String?) async throws -> PokemonListDTO
    func fetchDetails(id: Int) async throws -> PokemonDetailDTO
}

//
//  RepositoryType.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

protocol RepositoryType {
    func fetchPage(nextPageUrl: String?) async throws -> PokemonPage
    func fetchDetails(id: Int) async throws -> PokemonDetail
}

//
//  PokemonListDTO.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

// MARK: - Data Transfer Object
struct PokemonListDTO: Decodable {
    let count: Int?
    let next: String?
    let results: [PokemonDTO]?
}

extension PokemonListDTO {
    struct PokemonDTO: Decodable {
        let name: String?
        let url: String?
    }
}

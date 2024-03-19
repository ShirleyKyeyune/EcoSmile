//
//  PokemonDetailDTO.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

// MARK: - Data Transfer Object
struct PokemonDetailDTO: Decodable {
    let id: Int?
    let order: Int?
    let name: String?
    let height: Int?
    let weight: Int?
    let types: [TypeDTO]?
    let abilities: [AbilityDTO]?
    let baseExperience: Int?
    let stats: [StatDTO]?
}

extension PokemonDetailDTO {
    struct TypeDTO: Decodable {
        let slot: Int?
        let type: TypeDetailDTO?
    }

    struct TypeDetailDTO: Decodable {
        let name: String?
        let url: String?
    }

    struct AbilityDTO: Decodable {
        let ability: AbilityDetailDTO?
        let slot: Int?
    }

    struct AbilityDetailDTO: Decodable {
        let name: String?
        let url: String?
    }

    struct StatDTO: Decodable {
        enum CodingKeys: String, CodingKey {
            case baseStat = "base_stat"
            case effort
            case stat
        }

        let baseStat: Int?
        let effort: Int?
        let stat: StatDetailDTO?
    }

    struct StatDetailDTO: Decodable {
        let name: String?
        let url: String?
    }
}

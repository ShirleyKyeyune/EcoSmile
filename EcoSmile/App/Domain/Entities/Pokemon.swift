//
//  Pokemon.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

struct Pokemon: Equatable, Identifiable {
    typealias Identifier = String

    let id: Identifier
    let name: String
    let url: String
    let thumbnailUrl: String?
    let fullImageUrl: String?
}

struct PokemonPage: Equatable {
    let count: Int
    let next: String?
    let result: [Pokemon]
}

//
//  PokemonImageBaseURL.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

enum PokemonImageBaseURL {
    case thumbnail
    case fullImage

    var url: String {
        switch self {
        case .thumbnail:
            return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/%@.png"
        case .fullImage:
            return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/%@.png"
        }
    }
}

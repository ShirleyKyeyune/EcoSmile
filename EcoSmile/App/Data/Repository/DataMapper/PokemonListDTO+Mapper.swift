//
//  PokemonListDTO+Mapper.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

// MARK: - Mappings to Domain
extension PokemonListDTO {
    func toDomain() -> PokemonPage {
        .init(
            count: count ?? 0,
            next: next,
            result: results?.compactMap { $0.toDomain() } ?? []
        )
    }
}

extension PokemonListDTO.PokemonDTO {
    func toDomain() -> Pokemon? {
        guard let url = url,
              let id = getPokemonID(from: url),
              let displayName = displayName
        else {
            return nil
        }
        return .init(
            id: Pokemon.Identifier(id),
            name: displayName,
            url: url,
            thumbnailUrl: thumbnailURLString,
            fullImageUrl: fullImageURLString
        )
    }

    var pokemonID: String? {
        guard let url = url else {
            return nil
        }
        return getPokemonID(from: url)
    }

    var displayName: String? {
        guard let name = name else {
            return nil
        }
        return name.prefix(1).uppercased() + name.suffix(name.count - 1)
    }

    var thumbnailURLString: String? {
        guard let pokemonID = pokemonID else {
            return nil
        }
        return getPokemonImageURL(baseURL: .thumbnail, pokemonID: pokemonID)
    }

    var fullImageURLString: String? {
        guard let pokemonID = pokemonID else {
            return nil
        }
        return getPokemonImageURL(baseURL: .fullImage, pokemonID: pokemonID)
    }

    func getPokemonID(from url: String) -> String? {
        let pattern = "\\/(\\d+)\\/?$"
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let nsString = url as NSString
            let results = regex.matches(in: url, options: [], range: NSRange(location: 0, length: nsString.length))

            if let match = results.first {
                return nsString.substring(with: match.range(at: 1))
            }
        } catch {
            print("Invalid regex: \(error.localizedDescription)")
        }

        return nil
    }

    func getPokemonImageURL(baseURL: PokemonImageBaseURL, pokemonID: String) -> String {
        String(format: baseURL.url, pokemonID)
    }
}

//
//  PokemonDetailDTO+Mapper.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import Foundation

// MARK: - Mappings to Domain
extension PokemonDetailDTO {
    func toDomain() -> PokemonDetail {
        let abilities = abilities ?? []
        let types = types ?? []
        let stats = stats ?? []

        let pokemonAbilities = abilities.compactMap { $0.toDomain() }
        let pokemonTypes = types.compactMap { $0.toDomain() }
        let pokemonStats = stats.compactMap { $0.toDomain() }
        return PokemonDetail(
            id: self.id ?? 0,
            name: self.name ?? "",
            height: self.height ?? 0,
            weight: self.weight ?? 0,
            types: pokemonTypes,
            abilities: pokemonAbilities,
            stats: pokemonStats
        )
    }
}

extension PokemonDetailDTO.TypeDTO {
    func toDomain() -> PokemonDetail.PokemonType? {
        guard let slot = slot,
              let type = type?.toDomain()
        else {
            return nil
        }

        return PokemonDetail.PokemonType(
            id: "\(slot)",
            slot: slot,
            type: type
        )
    }
}

extension PokemonDetailDTO.TypeDetailDTO {
    func toDomain() -> PokemonDetail.PokemonTypeDetail? {
        guard let name = name,
              let url = url
        else {
            return nil
        }

        return PokemonDetail.PokemonTypeDetail(
            id: name,
            name: name,
            url: url
        )
    }
}

extension PokemonDetailDTO.StatDTO {
    func toDomain() -> PokemonDetail.PokemonStat? {
        guard let baseStat = baseStat,
              let name = stat?.name?.capitalized
        else {
            return nil
        }
        let progress = (Float(baseStat) / 100.0)

        return PokemonDetail.PokemonStat(id: name, name: name, progress: progress)
    }
}

extension PokemonDetailDTO.AbilityDTO {
    func toDomain() -> PokemonDetail.PokemonAbility? {
        guard let name = ability?.name,
              let url = ability?.url,
              let slot = slot
        else {
            return nil
        }

        return PokemonDetail.PokemonAbility(
            id: name,
            name: name,
            url: url,
            slot: slot
        )
    }
}

extension Float {
    func roundedUp() -> Float {
        self >= 0 ? floor(self + 0.5) : ceil(self - 0.5)
    }
}

//
//  PokemonDetailView+ViewModel.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import SwiftUI

extension PokemonDetailView {
    @MainActor
    class ViewModel: ObservableObject {
        // Published properties for SwiftUI
        @Published var pokemonDetail: PokemonDetail?
        @Published var isLoading: Bool = false
        @Published var errorMessage: String?

        private let pokemonRepository: RepositoryType
        let pokemon: Pokemon

        init(
            pokemon: Pokemon,
            pokemonRepository: RepositoryType = PokemonRepository())
        {
            self.pokemon = pokemon
            self.pokemonRepository = pokemonRepository
        }

        func didAppear() {
            Task {
                await fetchPokemonDetail()
            }
        }

        private func fetchPokemonDetail() async {
            isLoading = true
            do {
                guard let pokemonId = Int(pokemon.id) else {
                    errorMessage = "Invalid Id \(pokemon.id)"
                    isLoading = false
                    return
                }

                let detail = try await pokemonRepository.fetchDetails(id: pokemonId)
                DispatchQueue.main.async { [weak self] in
                    guard let `self` = self else {
                        return
                    }
                    self.pokemonDetail = detail
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async { [weak self] in
                    guard let `self` = self else {
                        return
                    }
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
}

extension PokemonDetailView.ViewModel {
    var pageTitle: String {
        pokemon.name
    }

    var commaSeparatedTypes: String {
        pokemonDetail?.types.map { $0.type?.name ?? "" }.joined(separator: ", ") ?? "No Known Types"
    }

    var abilities: [String] {
        pokemonDetail?.abilities.map { $0.name } ?? []
    }

    var stats: [PokemonDetail.PokemonStat] {
        pokemonDetail?.stats ?? []
    }

    var height: String {
        guard let height = pokemonDetail?.height else {
            return "Unknown"
        }
        return "\(height)"
    }

    var weight: String {
        guard let weight = pokemonDetail?.weight else {
            return "Unknown"
        }
        return "\(weight)"
    }

    var fullImage: String? {
        pokemon.fullImageUrl
    }
}

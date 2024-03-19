//
//  PokemonViewModel.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import SwiftUI

extension HomeView {
    @MainActor
    class ViewModel: ObservableObject {
        @Published var pokemons: [Pokemon] = []
        @Published var isLoading: Bool = false
        @Published var errorMessage: String?

        private var nextPage: String?
        private var repository: RepositoryType

        var isEmpty: Bool {
            pokemons.isEmpty
        }

        init(repository: RepositoryType = MockPokemonRepository()) {
            self.repository = repository
        }

        func didAppear() {
            Task {
                await fetchPokemons()
            }
        }

        func didReachBottom() {
            log("Reached Bottom, loading more")
            Task {
                await fetchPokemons(nextPageUrl: nextPage)
            }
        }

        private func fetchPokemons(nextPageUrl: String? = nil) async {
            isLoading = true
            do {
                let fetchedPokemons = try await repository.fetchPage(nextPageUrl: nextPageUrl)
                DispatchQueue.main.async { [weak self] in
                    guard let `self` = self else {
                        return
                    }
                    self.nextPage = fetchedPokemons.next
                    self.pokemons = fetchedPokemons.result
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

        func searchFired(term: String) {
            Task {
                await searchPokemons(term: term)
            }
        }

        private func searchPokemons(term: String) async {
            guard !term.isEmpty else {
                await fetchPokemons()
                return
            }

            isLoading = true
            do {
                let response = try await repository.fetchPage(nextPageUrl: term)
                DispatchQueue.main.async { [weak self] in
                    self?.pokemons = response.result.filter { $0.name.contains(term) }
                    self?.isLoading = false
                }
            } catch {
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    self?.isLoading = false
                }
            }
        }
    }
}

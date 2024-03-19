//
//  HomeView.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.isEmpty {
                    CustomEmptyView()
                } else {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(viewModel.pokemons, id: \.id) { pokemon in
                            let destination = PokemonDetailView(
                                viewModel: PokemonDetailView.ViewModel(pokemon: pokemon))

                            NavigationLink(destination: destination) {
                                PokemonCell(
                                    name: pokemon.name,
                                    imageUrl: pokemon.thumbnailUrl
                                )
                                .onAppear {
                                    if pokemon == viewModel.pokemons.last {
                                        viewModel.didReachBottom()
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .searchable(text: $searchText, prompt: "Search Pokémon...")
            .onChange(of: searchText) { _, newText in
                viewModel.searchFired(term: newText)
            }
            .navigationTitle("Pokémon")
        }
        .onAppear {
            viewModel.didAppear()
        }
    }
}

#Preview {
    HomeView(viewModel: HomeView.ViewModel())
}

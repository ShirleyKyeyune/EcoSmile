//
//  PokemonDetailView.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import SwiftUI

struct PokemonDetailView: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            VStack {
                HeroImageView(title: viewModel.pageTitle, imageUrl: viewModel.fullImage)

                VStack(spacing: 20) {
                    DetailView(
                        height: viewModel.height,
                        weight: viewModel.weight,
                        types: viewModel.commaSeparatedTypes
                    )

                    AbilitiesView(abilities: viewModel.abilities)

                    StatsView(stats: viewModel.stats)
                }
                .padding()
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            withAnimation(nil) {
                self.presentationMode.wrappedValue.dismiss()
            }
        }) {
            HStack {
                Image(systemName: "chevron.backward")
                Text("Back")
            }
            .foregroundColor(.black)
        })
        .onAppear {
            viewModel.didAppear()
        }
    }
}

#Preview {
    PokemonDetailView(viewModel: PokemonDetailView.ViewModel(pokemon: Pokemon(id: "1", name: "adfa", url: "", thumbnailUrl: nil, fullImageUrl: nil)))
}

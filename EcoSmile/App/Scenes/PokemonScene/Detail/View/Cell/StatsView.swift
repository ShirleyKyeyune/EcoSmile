//
//  StatsView.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import SwiftUI

struct StatsView: View {
    var stats: [PokemonDetail.PokemonStat]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Stats")
                .font(.system(size: 20, weight: .bold))

            if stats.isEmpty {
                Text("Stats not available")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
            } else {
                ForEach(stats) { stat in
                    HStack {
                        Text(stat.name)
                            .frame(width: 100, alignment: .leading) // Adjust width as needed
                        StatProgressView(progress: stat.progress)
                    }
                }
            }
        }
        .padding()
    }
}


#Preview {
    let stats = [
        PokemonDetail.PokemonStat(id: "1", name: "Adfad", progress: 0.54),
        PokemonDetail.PokemonStat(id: "3", name: "BAda", progress: 0.28),
    ]

    return StatsView(stats: stats)
}

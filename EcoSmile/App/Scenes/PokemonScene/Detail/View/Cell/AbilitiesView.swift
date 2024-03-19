//
//  AbilitiesView.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import SwiftUI

struct AbilitiesView: View {
    var abilities: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Abilities")
                .font(.system(size: 20, weight: .bold))

            if abilities.isEmpty {
                Text("Abilities not available")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
            } else {
                ForEach(abilities, id: \.self) { ability in
                    AbilityView(abilityName: ability, icon: Image("ability_ico"))
                }
            }
        }
        .padding()
    }
}

#Preview {
    AbilitiesView(abilities: ["adfal", "adfadfasd"])
}

//
//  AbilityView.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import SwiftUI

struct AbilityView: View {
    var abilityName: String
    var icon: Image

    var body: some View {
        HStack(spacing: 8) { // Adjust spacing as needed
            icon
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(randomColor())

            Text(abilityName)
                .font(.system(size: 14))
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)

            Spacer()
        }
        .padding(.horizontal, 8) // Adjust padding as needed
        .padding(.vertical, 4) // Adjust vertical padding as needed
    }

    private func randomColor() -> Color {
        Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}

#Preview {
    AbilityView(abilityName: "Ability Name", icon: Image("ability_ico"))
}

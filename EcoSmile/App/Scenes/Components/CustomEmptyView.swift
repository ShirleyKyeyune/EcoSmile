//
//  EmptyView.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import SwiftUI

struct CustomEmptyView: View {
    var image: Image = Image("empty_state")
    var text: String = "Nothing to see!"

    var body: some View {
        VStack(spacing: 16) { // Adjust spacing as needed
            image
                .resizable()
                .frame(width: 150, height: 150) // Adjust size as needed

            Text(text)
                .font(.system(size: 20)) // Adjust font size as needed
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    CustomEmptyView()
}

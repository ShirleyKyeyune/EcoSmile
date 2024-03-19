//
//  CardView.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import SwiftUI

struct CardView<Content: View>: View {
    var backgroundColor: Color = .gray
    var content: Content

    var body: some View {
        content
            .padding()
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    CardView(content: Text("Hello Shirley"))
}

//
//  DetailView.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import SwiftUI

struct DetailView: View {
    var height: String
    var weight: String
    var types: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Height:")
                    .foregroundColor(.gray)
                Text(height)
                    .foregroundColor(.red)
            }

            HStack {
                Text("Weight:")
                    .foregroundColor(.gray)
                Text(weight)
                    .foregroundColor(.purple)
            }

            HStack {
                Text("Types:")
                    .foregroundColor(.gray)
                Text(types)
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

#Preview {
    DetailView(height: "80", weight: "43", types: "EAddaada")
}

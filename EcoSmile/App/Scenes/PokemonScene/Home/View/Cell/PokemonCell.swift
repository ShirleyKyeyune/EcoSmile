//
//  PokemonCell.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import SwiftUI

@MainActor
struct PokemonCell: View {
    var name: String
    var imageUrl: String?
    @State private var backgroundColor: Color = .gray
    @State private var textColor: Color = .white

    private let cellPadding: CGFloat = 16
    private let cellWidth = (UIScreen.main.bounds.width / 2) - 64
    private var cellHeight: CGFloat {
        return cellWidth * 1.3
    }

    var body: some View {
        CardView(
            backgroundColor: backgroundColor,
            content: VStack {
                if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: cellWidth, height: cellHeight * 0.7)
                                .clipped()
                                .onAppear {
                                    DispatchQueue.main.async {
                                        //let uiImage = phase.uiImage
                                        //let averageColor = uiImage?.averageColor ?? UIColor.gray
                                        backgroundColor = .cyan.opacity(0.3)
                                        textColor = .black.opacity(0.6)
                                    }
                                }
                        } else if phase.error != nil {
                            placeholder
                        } else {
                            ProgressView()
                                .frame(width: cellWidth, height: cellHeight * 0.7)
                        }
                    }
                } else {
                    placeholder
                }

                Text(name)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(textColor)
                    .padding(.top)
            }
        )
        .frame(width: cellWidth, height: cellHeight)
        .padding(cellPadding)
    }

    var placeholder: some View {
        Image("placeholder")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: cellWidth, height: cellHeight * 0.7)
            .clipped()
    }

}

#Preview {
    PokemonCell(name: "Pikachu", imageUrl: "pikachu")
}

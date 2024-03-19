//
//  HeroImageView.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import SwiftUI

struct HeroImageView: View {
    var title: String
    var imageUrl: String? = nil
    @State private var backgroundColor: Color = .gray

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .onAppear {
                                DispatchQueue.main.async {
//                                    let uiImage = image.uiImage
//                                    let averageColor = uiImage?.averageColor ?? UIColor.gray
//                                    backgroundColor = Color(averageColor)
                                    backgroundColor = .cyan.opacity(0.3)
                                }
                            }
                    } else if phase.error != nil {
                        Image("placeholder")
                    } else {
                        ProgressView()
                    }
                }
            } else {
                Image("placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }

            Rectangle()
                .foregroundColor(.black.opacity(0.5))
                .frame(height: 60) // Adjust height as needed

            Text(title)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
                .padding()
        }
        .background(backgroundColor)
        .clipped()
    }
}

#Preview {
    HeroImageView(title: "pokemon name")
}

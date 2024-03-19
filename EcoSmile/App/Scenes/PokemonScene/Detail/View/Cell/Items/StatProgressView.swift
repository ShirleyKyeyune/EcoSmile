//
//  StatProgressView.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import SwiftUI

struct StatProgressView: View {
    var progress: Float // Progress value should be between 0.0 and 1.0

    var body: some View {
        HStack(spacing: 8) {
            Text("\(progressPercentage)%")
                .font(.system(size: 12)) // Adjust font size as needed

            ProgressBar(progress: progress)
                .frame(height: 4) // Adjust height of the progress bar as needed
        }
        .padding(.horizontal, 8) // Adjust horizontal padding as needed
    }

    private var progressPercentage: String {
        String(format: "%.2f", progress * 100)
    }
}

struct ProgressBar: View {
    var progress: Float // Progress value should be between 0.0 and 1.0

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.3)) // Background color of the progress bar
                    .frame(width: geometry.size.width, height: geometry.size.height)

                Rectangle()
                    .foregroundColor(.blue) // Foreground color of the progress bar
                    .frame(width: min(CGFloat(progress) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .animation(.linear, value: progress)
            }
            .cornerRadius(geometry.size.height / 2) // Make the progress bar rounded
        }
    }
}

#Preview {
    StatProgressView(progress: 0.75)
}

//
//  ContentView.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = true

    var body: some View {
        Group {
            if isLoading {
                LoadingView().onAppear {
                    // Simulate a loading delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isLoading = false
                    }
                }
            } else {
                HomeView(viewModel: HomeView.ViewModel())
            }
        }
    }
}

#Preview {
    ContentView()
}

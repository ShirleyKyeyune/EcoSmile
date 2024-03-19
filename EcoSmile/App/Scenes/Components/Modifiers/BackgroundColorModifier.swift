//
//  BackgroundColorModifier.swift
//  EcoSmile
//
//  Created by Shirley Kyeyune on 19/03/2024.
//

import SwiftUI

struct BackgroundColorModifier: ViewModifier {
    var color: Color

    func body(content: Content) -> some View {
        content
            .background(color)
    }
}

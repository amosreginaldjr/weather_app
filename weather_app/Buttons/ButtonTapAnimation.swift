//
//  ButtonTapAnimation.swift
//  weather_app
//
//  Created by Amos Reginald Jr. on 3/10/25.
//

import Foundation
import SwiftUI

struct ButtonTapAnimation: ViewModifier {
    @State private var isTapped = false

    func body(content: Content) -> some View {
        content
            .scaleEffect(isTapped ? 1.2 : 1.0)
            .onTapGesture {
                withAnimation(.spring()) {
                    isTapped = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.spring()) {
                        isTapped = false
                    }
                }
            }
    }
}

// Extension for easy use
extension View {
    func animateUserTap() -> some View {
        self.modifier(ButtonTapAnimation())
    }
}

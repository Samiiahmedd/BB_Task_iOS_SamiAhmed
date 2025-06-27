//
//  MainViewPadding.swift
//  GoApp
//
//  Created by Abdalazem Saleh on 09/04/2025.
//

import SwiftUI

struct MainViewPadding: ViewModifier {
    var horizontalPadding: CGFloat
    var topPadding: CGFloat
    
    func body(content: Content) -> some View {
        return content
            .padding(.top, topPadding)
            .padding(.horizontal, horizontalPadding)
    }
}

extension View {
    func mainViewPadding(horizontalPadding: CGFloat = 20, topPadding: CGFloat = 40) -> some View {
        return self.modifier(MainViewPadding(horizontalPadding: horizontalPadding, topPadding: topPadding))
    }
}

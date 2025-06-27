//
//  TextLoader.swift
//  GoApp
//
//  Created by Abdalazem Saleh on 25/03/2025.
//


import SwiftUI

struct TextLoader: View {
    
    var text: String = "Loading..."
    
    @State private var isAnimating = false

    var body: some View {
        Text(text)
            .appFont(size: 24, weight: .bold)
            .foregroundColor(.gray)
            .overlay(
                LinearGradient(
                    gradient: Gradient(colors: [.clear, .white.opacity(0.6), .clear]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .offset(x: isAnimating ? 200 : -200)
            )
            .onAppear {
                withAnimation(
                    Animation.linear(duration: 1.5)
                        .repeatForever(autoreverses: true)
                ) {
                    isAnimating.toggle()
                }
            }
    }
}

#Preview {
    TextLoader()
}

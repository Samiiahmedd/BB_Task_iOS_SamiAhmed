//
//  CirclerView.swift
//  GoApp
//
//  Created by Abdalazem Saleh on 25/03/2025.
//


import SwiftUI

struct CirclerView: View {
    
    var strokeColor: Color

    @State private var showSpinner:Bool = false
    @State private var degree:Int = 270
    @State private var spinnerLength = 0.6
    
    var body: some View {
        Circle()
            .trim(from: 0.0,to: spinnerLength)
            .stroke(
                strokeColor,
                style: StrokeStyle(
                    lineWidth: 3.0,
                    lineCap: .round
                )
            )
            .animation(
                Animation.easeIn(duration: 1.5)
                    .repeatForever(autoreverses: true),
                value: showSpinner
            )
            .rotationEffect(Angle(degrees: Double(degree)))
            .animation(
                Animation.linear(duration: 1)
                    .repeatForever(autoreverses: false),
                value: showSpinner
            )
            .onAppear {
                showSpinner = true
                degree = 270 + 360
                spinnerLength = 0
            }
    }
}

#Preview {
    CirclerView(strokeColor: .red)
        .frame(width: 32, height: 32)
}

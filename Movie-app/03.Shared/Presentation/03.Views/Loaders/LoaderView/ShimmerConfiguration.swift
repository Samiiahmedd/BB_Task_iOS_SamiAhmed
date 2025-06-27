//
//  ShimmerConfiguration.swift
//  GoApp
//
//  Created by Abdalazem Saleh on 25/03/2025.
//


import SwiftUI

// MARK: - CONFIGURATIONS

struct ShimmerConfiguration {
    typealias Point = (start: UnitPoint, end: UnitPoint)
    
    let gradient: Gradient
    let initialLocation: Point
    let finalLocation: Point
    let duration: TimeInterval
    let opacity: Double
    static let `default` = ShimmerConfiguration(
        gradient: Gradient(stops: [
            .init(color: .black, location: 0),
            .init(color: .white, location: 0.3),
            .init(color: .white, location: 0.7),
            .init(color: .black, location: 1),
        ]),
        initialLocation: (start: UnitPoint(x: -1, y: 0.5), end: .leading),
        finalLocation: (start: .trailing, end: UnitPoint(x: 2, y: 0.5)),
        duration: 2,
        opacity: 0.6
    )
}

struct ShimmerAntimationView<Content: View>: View {
    
    private let content: () -> Content
    private let configuration: ShimmerConfiguration
    @State private var startPoint: UnitPoint
    @State private var endPoint: UnitPoint
    
    init(configuration: ShimmerConfiguration, @ViewBuilder content: @escaping () -> Content) {
        self.configuration = configuration
        self.content = content
        _startPoint = .init(wrappedValue: configuration.initialLocation.start)
        _endPoint = .init(wrappedValue: configuration.initialLocation.end)
    }
    
    var body: some View {
        ZStack {
            content()
            LinearGradient(
                gradient: configuration.gradient,
                startPoint: startPoint,
                endPoint: endPoint
            )
            .opacity(configuration.opacity)
            .blendMode(.screen)
            .onAppear {
                withAnimation(
                    Animation.linear(duration: configuration.duration)
                        .repeatForever(autoreverses: false)
                ) {
                    startPoint = configuration.finalLocation.start
                    endPoint = configuration.finalLocation.end
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

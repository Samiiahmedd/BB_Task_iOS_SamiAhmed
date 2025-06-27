//
//  BlurredButton.swift
//  GoApp
//
//  Created by Abdalazem Saleh on 13/04/2025.
//

import SwiftUI

struct BlurredButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.ultraThinMaterial)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white, lineWidth: 1)
                    }
            }
    }
}

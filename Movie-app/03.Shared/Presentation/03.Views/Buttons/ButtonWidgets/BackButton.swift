//
//  BackButton.swift
//  GoApp
//
//  Created by Abdalazem Saleh on 14/04/2025.
//

import SwiftUI

struct BackButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "chevron.backward")
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(.white)
                .background {
                    Circle()
                        .fill(.ultraThinMaterial)
                        .frame(width: 32, height: 32)
                        .overlay {
                            Circle()
                                .stroke(.white, lineWidth: 1)
                                .frame(width: 32, height: 32)
                        }
                }
        }
        .frame(width: 40, height: 40)
    }
}

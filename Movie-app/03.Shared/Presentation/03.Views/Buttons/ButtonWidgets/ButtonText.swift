//
//  ButtonText.swift
//  GoApp
//
//  Created by Abdalazem Saleh on 15/04/2025.
//

import SwiftUI

struct ButtonText: View {
    
    // MARK: - Properties
    /// Text
    let text: String
    var localizationFile: LocalizationFiles = .MainApp
    /// Font
    var fontSize: CGFloat = 12
    var fontWeight: FontWeight = .regular
    /// Style
    var foregroundStyle: Color = .appPrimary
    /// Configurations
    var action: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button {
            action()
        } label: {
            Text(text.localized(from: localizationFile))
                .appFont(size: fontSize, weight: fontWeight)
                .foregroundStyle(foregroundStyle)
        }
    }
}

#Preview {
    ButtonText(text: "Next") {
        
    }
}

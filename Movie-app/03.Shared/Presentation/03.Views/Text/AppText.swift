//
//  AppText.swift
//  GoApp
//
//  Created by Abdalazem Saleh on 10/04/2025.
//

import SwiftUI

struct AppText: View {
    
    // MARK: - Properties
    /// Text
    var text: String
    var localizationFile: LocalizationFiles = .MainApp
    var textAlignment: TextAlignment = .leading
    /// Font
    var fontSize: CGFloat = 12
    var fontWeight: FontWeight = .bold
    var lineLimit: Int = 0
    /// Style
    
    // MARK: - Body
    var body: some View {
        if #available(iOS 16.0, *) {
            Text(
                LocalizedStringResource(
                    stringLiteral: text.localized(
                        from: localizationFile
                    )
                )
            )
            .multilineTextAlignment(textAlignment)
            .appFont(size: fontSize, weight: fontWeight)
        } else {
            Text(text.localized(from: localizationFile))
            .multilineTextAlignment(textAlignment)
            .appFont(size: fontSize, weight: fontWeight)
        }
    }
}

#Preview {
    AppText(text: "Login")
}



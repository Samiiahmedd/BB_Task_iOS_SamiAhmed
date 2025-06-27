//
//  TextButtonWithUnderline.swift
//  GoApp
//
//  Created by Abdalazem Saleh on 16/04/2025.
//

import SwiftUI

struct TextButtonWithUnderline: View {
    var title: String
    var localizationFile: LocalizationFiles = .MainApp
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            if #available(iOS 16.0, *) {
                AppText(text: title, localizationFile: localizationFile)
                    .foregroundColor(.appPrimary)
                    .underline(true, color: .appPrimary)
            } else {
                AppText(text: title, localizationFile: localizationFile)
                    .foregroundColor(.appPrimary)
            }
        }
    }
}

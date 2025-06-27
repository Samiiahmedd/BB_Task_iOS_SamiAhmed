//
//  TextFieldPlaceHolder.swift
//  GoApp
//
//  Created by Abdalazem Saleh on 09/04/2025.
//

import SwiftUI

extension View {
    func placeholder(
        _ placeholder: String,
        localizationFile: LocalizationFiles,
        when shouldShow: Bool,
        alignment: Alignment = .leading
        ) -> some View {
            
            ZStack(alignment: alignment) {
                if #available(iOS 16.0, *) {
                    Text(
                        LocalizedStringResource(
                            stringLiteral: placeholder.localized(
                                from: localizationFile
                            )
                        )
                    )
                    .foregroundColor(.appDarkGray)
                    .opacity(shouldShow ? 1 : 0)
                } else {
                    Text(placeholder.localized(from: localizationFile))
                    .foregroundColor(.appDarkGray)
                    .opacity(shouldShow ? 1 : 0)
                }
                self
            }
        }
}

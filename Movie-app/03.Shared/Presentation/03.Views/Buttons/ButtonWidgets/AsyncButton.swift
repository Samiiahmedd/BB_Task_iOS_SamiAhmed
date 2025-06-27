//
//  AsyncButton.swift
//  GoApp
//
//  Created by Abdalazem Saleh on 01/04/2025.
//

import SwiftUI

struct AsyncButton: View {
    @Binding var isLoading: Bool
    
    var buttonTitle: String
    var localizationFile: LocalizationFiles = .MainApp
    var buttonStyle: buttonStyleEnum = .filled
    var action: () -> Void
    var color: Color = .appPrimary
    var foregroundColor: Color = .white
    var height: CGFloat = 48
    
    enum buttonStyleEnum {
        case filled
        case outlined
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            switch buttonStyle {
            case .filled:
                RoundedRectangle(cornerRadius: 8)
                    .frame(height: height)
                    .overlay {
                        if isLoading {
                            LoaderView(type: .circle(color: foregroundColor))
                                .frame(width: 24, height: 24)
                        } else {
                            if #available(iOS 16.0, *) {
                                Text(
                                    LocalizedStringResource(
                                        stringLiteral: buttonTitle.localized(
                                            from: localizationFile
                                        )
                                    )
                                )
                                .appFont(size: 14, weight: .medium)
                                .foregroundStyle(foregroundColor)
                            } else {
                                Text(buttonTitle.localized(from: localizationFile))
                                .appFont(size: 14, weight: .medium)
                                .foregroundStyle(foregroundColor)
                            }
                        }
                    }
                    .foregroundStyle(color)
            case .outlined:
                RoundedRectangle(cornerRadius: 8)
                    .stroke(color, lineWidth: 1)
                    .frame(height: height)
                    .overlay {
                        if isLoading {
                            LoaderView(type: .circle(color: color))
                                .frame(width: 24, height: 24)
                        } else {
                            if #available(iOS 16.0, *) {
                                Text(
                                    LocalizedStringResource(
                                        stringLiteral: buttonTitle.localized(
                                            from: localizationFile
                                        )
                                    )
                                )
                                .appFont(size: 14, weight: .medium)
                                .foregroundStyle(color)
                            } else {
                                Text(buttonTitle.localized(from: localizationFile))
                                .appFont(size: 14, weight: .medium)
                                .foregroundStyle(color)
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    AsyncButton(
        isLoading: .constant(true),
        buttonTitle: "Login",
        buttonStyle: .filled
    ) {
        
    }
    .padding(.horizontal)
}

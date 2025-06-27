//
//  AppTextField.swift
//  GoApp
//
//  Created by Abdalazem Saleh on 09/04/2025.
//

import SwiftUI

struct AppTextField: View {
    
    // MARK: - PROPERTYS
    @Binding var text: String
    @Binding var errorMessage: String
    @State private var isSecure: Bool = false
    @State private var isValid = true
    @FocusState private var isTyping: Bool
    
    var placeholder: String
    var localizationFile: LocalizationFiles = .MainApp
    var keyBoardType: UIKeyboardType = .default
    var icone: Image?
    var isPasswordField: Bool = false
    var charsLimit: Int = 128
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                HStack {
                    if let icone {
                        icone
                            .resizable()
                            .frame(width: 16, height: 16)
                            .foregroundStyle(.appDarkGray)
                    }
                    
                    if isSecure {
                        SecureField("", text: $text)
                            .placeholder(
                                placeholder,
                                localizationFile: localizationFile,
                                when: text.isEmpty
                            )
                            .textFieldConfigurations(keyboardType: keyBoardType)
                            .focused($isTyping)
                            .onChange(of: text) { newValue in
                                let filtered = newValue.filter { $0.isLetter || $0.isNumber }
                                if filtered.count > charsLimit {
                                    text = String(filtered.prefix(charsLimit))
                                } else {
                                    text = filtered
                                }
                            }
                    } else {
                        TextField("", text: $text)
                            .placeholder(
                                placeholder,
                                localizationFile: localizationFile,
                                when: text.isEmpty
                            )
                            .textFieldConfigurations(keyboardType: keyBoardType)
                            .focused($isTyping)
                            .onChange(of: text) { newValue in
                                if isPasswordField {
                                    let filtered = newValue.filter { $0.isLetter || $0.isNumber }
                                    if filtered.count > charsLimit {
                                        text = String(filtered.prefix(charsLimit))
                                    } else {
                                        text = filtered
                                    }
                                } else {
                                    if newValue.count > charsLimit {
                                        text = String(newValue.prefix(charsLimit))
                                    }
                                }
                            }
                    }

                }
            }
            .frame(height: 48)
            .animation(Animation.easeInOut(duration: 0.1), value: UUID())
            .padding(.horizontal, 16)
            .borderedView(color: borderColor())
            .task {
                isSecure = isPasswordField ? true : false
            }
            
            if !errorMessage.isEmpty {                    #warning("Change border color to red when error")
                Text(errorMessage)
                    .appFont(size: 12, weight: .regular)
                    .foregroundColor(.red)
            }
        }
        .onChange(of: text) { _ in
            errorMessage = ""
        }
    }
    
    private func borderColor() -> Color {
        if isTyping {
            return .black
        } else if !isValid {
            return .red
        } else {
            return .appGray
        }
    }
}

#Preview {
    ZStack {
        AppTextField(
            text: .constant(""),
            errorMessage: .constant(""),
            placeholder: "Full Name",
            keyBoardType: .phonePad
        )
        .padding()
    }
    .frame(maxWidth: .infinity, maxHeight: . infinity)
    .background(.appBackground)
}

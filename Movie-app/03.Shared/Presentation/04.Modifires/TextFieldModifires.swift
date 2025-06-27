//
//  TextFieldModifires.swift
//  GoApp
//
//  Created by Abdalazem Saleh on 01/04/2025.
//

import SwiftUI


struct TextFieldModifires: ViewModifier {
    
    /// Properties
    var fontSize: CGFloat
    var fontweight: FontWeight
    var foregroundColor: Color
    var keyboardType: UIKeyboardType
    var isAuthCorrectionDisabeld: Bool
    
    /// Modifire
    func body(content: Content) -> some View {
        return content
            .appFont(size: fontSize, weight: fontweight)
            .foregroundStyle(foregroundColor)
            .keyboardType(keyboardType)
            .autocorrectionDisabled(isAuthCorrectionDisabeld)
    }
}


extension View {
    func textFieldConfigurations(fontSize: CGFloat = 12, fontWeight: FontWeight = .regular, foregroundColor: Color = .appDarkGray, keyboardType: UIKeyboardType = .default, isAuthCorrectionDisabeld: Bool = true) -> some View {
        self.modifier(
            TextFieldModifires(
                fontSize: fontSize,
                fontweight: fontWeight,
                foregroundColor: foregroundColor,
                keyboardType: keyboardType,
                isAuthCorrectionDisabeld: isAuthCorrectionDisabeld
            )
        )
    }
}

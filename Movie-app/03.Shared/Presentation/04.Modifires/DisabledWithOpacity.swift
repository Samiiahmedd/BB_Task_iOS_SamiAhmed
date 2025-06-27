//
//  DisabledWithOpacity.swift
//  GoApp
//
//  Created by Abdalazem Saleh on 15/04/2025.
//

import SwiftUI

struct DisabledWithOpacity: ViewModifier {
    var isDisabled: Bool

    func body(content: Content) -> some View {
        content
            .disabled(isDisabled)
            .opacity(isDisabled ? 0.5 : 1.0)
    }
}

extension View {
    func disabledWithOpacity(_ condition: Bool) -> some View {
        self.modifier(DisabledWithOpacity(isDisabled: condition))
    }
}

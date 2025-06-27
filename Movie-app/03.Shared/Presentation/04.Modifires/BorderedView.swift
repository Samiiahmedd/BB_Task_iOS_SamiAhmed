//
//  BorderedView.swift
//  GoApp
//
//  Created by Abdalazem Saleh on 07/04/2025.
//

import SwiftUI

struct BorderedView: ViewModifier {
    
    /// Properties
    var cornerRadius: CGFloat
    var color: Color
    var borderWidth: CGFloat
    var viewBGColor: Color
    
    /// Modifire
    func body(content: Content) -> some View {
        return content
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(
                        color,
                        lineWidth: borderWidth
                    )
                    .background(viewBGColor)
            )
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}


extension View {
    func borderedView(cornerRadius: CGFloat = 8, color: Color = .appGray, borderWidth: CGFloat = 1, viewBGColor: Color = .white) -> some View {
        self.modifier(BorderedView(cornerRadius: cornerRadius, color: color, borderWidth: borderWidth, viewBGColor: viewBGColor))
    }
}

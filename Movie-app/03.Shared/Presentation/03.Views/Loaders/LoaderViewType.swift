//
//  LoaderViewType.swift
//  GoApp
//
//  Created by Abdalazem Saleh on 25/03/2025.
//


import SwiftUI

enum LoaderViewType {
    case circle(color: Color)
    case ShimmerText(String)
}

struct LoaderView: View {
    
    var type: LoaderViewType
    @State var isAnimating: Bool = false
    
    var body: some View {
        switch type {
        case .circle(let color):
            CirclerView(strokeColor: color)
        case .ShimmerText(let text):
            TextLoader(text: text)
        }
    }
}

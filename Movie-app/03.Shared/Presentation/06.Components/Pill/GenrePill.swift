//
//  GenrePill.swift
//  Movie-app
//
//  Created by Sami on 26/06/2025.
//

import SwiftUI

struct GenrePill: View {
    let text: String
    
    var body: some View {
        AppText(
            text: text,
            fontSize: 12,
            fontWeight: .medium
        )
        .foregroundStyle(.white)
        .lineLimit(1)
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Color.appSecoundry)
        .cornerRadius(12)
    }
}

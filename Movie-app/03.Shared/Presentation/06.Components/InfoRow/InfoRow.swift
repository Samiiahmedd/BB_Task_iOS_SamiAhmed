//
//  InfoRow.swift
//  Movie-app
//
//  Created by Sami on 26/06/2025.
//

import SwiftUI

struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack(spacing: 6) {
            AppText(
                text: "\(label):",
                fontSize: 16,
                fontWeight: .light
            )
            .foregroundStyle(.white)
            
            AppText(
                text: value,
                fontSize: 12,
                fontWeight: .light
            )
            .foregroundStyle(.white)
            
        }
    }
}

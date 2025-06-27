//
//  File.swift
//  Movie-app
//
//  Created by Sami on 26/06/2025.
//

import SwiftUI

 var emptyStateView: some View {
    VStack {
        Spacer()
        AppText(
            text: "No movie details available",
            fontSize: 18,
            fontWeight: .medium
        )
        Spacer()
    }
}

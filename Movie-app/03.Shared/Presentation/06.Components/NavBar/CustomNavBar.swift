
//
//  CustomNavBar.swift
//  Movie-app
//
//  Created by Sami on 19/06/2025.
//

import SwiftUI

struct CustomNavBar: View {
    
    //MARK: - Propirites
    let title: String
    var showBackButton: Bool = true
    
    //MARK: - Body
    var body: some View {
        ZStack {
            Color.appSecoundry
                .ignoresSafeArea(edges: .top)

            HStack {
                if showBackButton {
                    Button(action: {
                        AppCoordinator.shared.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .medium))
                    }
                } else {
                    // Invisible placeholder to center title
                    Image(systemName: "chevron.left")
                        .opacity(0)
                }

                Spacer()

                AppText(
                    text: title,
                    textAlignment: .center,
                    fontSize: 18,
                    fontWeight: .medium
                )
                .foregroundColor(.white)

                Spacer()

                // Placeholder to keep title centered
                Image(systemName: "chevron.left")
                    .opacity(0)
            }
            .padding(.horizontal,40)
        }
        .frame(height: 48)
    }
}

#Preview {
    CustomNavBar(title: "Movie Details")
}

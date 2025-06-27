//
//  TapViewComponent.swift
//  Movie-app
//
//  Created by Sami on 24/06/2025.
//

import SwiftUI



struct MoviesTaps: View {
    
    // MARK: - Properties
    @Binding var selectedTab: HomeTab
    var isClicable: Bool = false
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 0) {
            ForEach(HomeTab.allCases) { tab in
                TabButton(tab: tab)
            }
        }
    }
    
    // MARK: - UI Components
    @ViewBuilder
    private func TabButton(tab: HomeTab) -> some View {
        let isSelected = tab == selectedTab
        
        Button {
            if isClicable {
                selectedTab = tab
            }
        } label: {
            VStack(spacing: 8) {
                AppText(text: tab.title,fontSize: 12,fontWeight: isSelected ? .bold : .medium)
                    .foregroundColor(isSelected ? .appSecoundry : .appGray)
                
                Rectangle()
                    .fill(isSelected ? Color.appSecoundry : Color.clear)
                    .frame(height: 2)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    MoviesTaps(selectedTab: .constant(.nowPlaying), isClicable: true)
}

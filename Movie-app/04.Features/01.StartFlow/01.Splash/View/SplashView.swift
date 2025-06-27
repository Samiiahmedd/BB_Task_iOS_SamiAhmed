import SwiftUI

struct SplashView: View {
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.appSecoundry
                .ignoresSafeArea()
            
            Image(.splash)
                .resizable()
                .scaledToFill()
                .opacity(0.2)
                .frame(width: Screen.width, height: Screen.height)
            
            AppText(
                text: "Where every movie finds its moment",
                fontSize: 16
            )
            .foregroundColor(.white)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                AppCoordinator.shared.showHome()
            }
        }
    }
}

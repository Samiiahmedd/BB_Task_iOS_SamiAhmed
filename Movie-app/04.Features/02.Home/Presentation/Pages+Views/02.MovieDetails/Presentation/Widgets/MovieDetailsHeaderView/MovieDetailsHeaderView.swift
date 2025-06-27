import SwiftUI

struct MovieDetailsHeaderView: View {
    
    // MARK: - Properties
    let backdropURL: String
    let rating: String
    let name: String
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 16) {
            
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(url: URL(string: backdropURL)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure:
                        Color.gray
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    case .empty:
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: Screen.width, height: Screen.quarterHeight)
                .cornerRadius(6)
                .clipped()
                
                AppText(
                    text: rating,
                    fontSize: 12,
                    fontWeight: .bold
                )
                .foregroundColor(.white)
                .padding(8)
                .background(Color.black.opacity(0.6))
                .cornerRadius(12)
                .padding(.trailing, 12)
                .padding(.bottom, 12)
            } //ZStack
            .frame(height: Screen.quarterHeight)
            
            AppText(text: name,
                    fontSize: 16,
                    fontWeight: .bold)
            .foregroundStyle(.white)
            
        } //VStack
    }
}

// Preview
#Preview {
    MovieDetailsHeaderView(
        backdropURL: "https://image.tmdb.org/t/p/w1280/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
        rating: "⭐️ 8.2", name: ""
    )
}

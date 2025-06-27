import SwiftUI

struct MoviePosterView: View {
    
    // MARK: - Properties
    let movieImage: String
    let movieName: String
    let releaseDate: String
    
    private let imageWidth: CGFloat = 150
    private let imageHeight: CGFloat = 225
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movieImage)")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: imageWidth, height: imageHeight)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageWidth, height: imageHeight)
                        .clipped()
                        .cornerRadius(12    )
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageWidth, height: imageHeight)
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }
            VStack(spacing:4) {
                AppText(text: movieName,
                        fontSize: 20,
                        fontWeight: .bold)
                .foregroundColor(.white)
                .frame(width: imageWidth, alignment: .leading)
                .lineLimit(1)
                
                AppText(text: "Release: \(releaseDate)",
                        fontSize: 8,
                        fontWeight: .medium)
                .foregroundColor(.colortxt)
                .frame(width: imageWidth, alignment: .leading)
            }
        }
    }
}

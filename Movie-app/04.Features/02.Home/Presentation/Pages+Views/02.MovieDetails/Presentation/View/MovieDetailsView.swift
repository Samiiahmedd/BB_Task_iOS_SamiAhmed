import SwiftUI

struct MovieDetailsView: View {
    
    // MARK: - Properties
    @ObservedObject private var viewModel: MovieDetailsViewModel
    
    // MARK: - Init
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .top) {
            Color.appPrimary
                .ignoresSafeArea()
            
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(1.5)
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
            } else if let movie = viewModel.movieDetails {
                movieContent(movie: movie)
            } else {
                emptyStateView
            }
            
            CustomNavBar(title: "Details")
        } //ZStack
//        .padding(.horizontal,24)
    }
    
    // MARK: - Subviews
    ///MainContent
    private func movieContent(movie: MovieDetailsDomain) -> some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                Spacer().frame(height: 28)
                
                ///Header
                MovieDetailsHeaderView(
                    backdropURL: "https://image.tmdb.org/t/p/w1280\(movie.backdropPath)",
                    rating: String(format: "⭐️ %.1f",
                                   movie.voteAverage),
                    name: movie.title
                )
                
                /// Production Companies
                productionCompaniesSection(movie: movie)
                
                /// Overview Section
                overviewSection(movie: movie)
                
                /// Additional Info
                additionalInfoSection(movie: movie)
                
                Spacer().frame(height: 40)
            } //VStack
            .padding(.top, 10)
            .padding(.horizontal, 20)
        } //ScrollView
    }
    
    ///ProductionCompanies
    private func productionCompaniesSection(movie: MovieDetailsDomain) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            AppText(
                text: "Production Companies",
                fontSize: 16,
                fontWeight: .medium
            )
            .foregroundColor(.white)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(movie.productionCompanies, id: \.id) { company in
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(company.logoPath)")) { image in
                            image
                                .resizable()
                                .padding(4)
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            Color.appSecoundry
                        }
                        .frame(width: 80, height: 40)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.appSecoundry.opacity(0.8), lineWidth: 0.8)
                        )
                    }
                } //Hstack
            } //ScrollView
        } //VStack
        .padding(.horizontal, 16)
    }
    
    ///Overview
    private func overviewSection(movie: MovieDetailsDomain) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            AppText(
                text: "Overview",
                fontSize: 16,
                fontWeight: .medium
            )
            .foregroundStyle(.white)
            
            AppText(
                text: movie.overview,
                fontSize: 14,
                fontWeight: .light
            )
            .foregroundStyle(.white)
            
            
            if !movie.tagline.isEmpty {
                AppText(
                    text: movie.tagline,
                    fontSize: 14,
                    fontWeight: .medium
                )
                .foregroundColor(.appSecoundry)
            }
        } //VStack
        .padding(.horizontal, 16)
    }
    
    ///AdditionalInfo
    private func additionalInfoSection(movie: MovieDetailsDomain) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                AppText(
                    text: "Genres",
                    fontSize: 16,
                    fontWeight: .medium
                )
                .foregroundStyle(.white)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(movie.genres, id: \.id) { genre in
                            GenrePill(text: genre.name)
                        }
                    } //HStack
                } //Scroll
            } //VStack
            
            VStack(alignment: .leading, spacing: 6) {
                if movie.budget > 0 {
                    InfoRow(label: "Budget", value: "$\(movie.budget.formattedWithSeparator())")
                } //VStack
                
                if movie.revenue > 0 {
                    InfoRow(label: "Revenue", value: "$\(movie.revenue.formattedWithSeparator())")
                }
                
                if !movie.status.isEmpty {
                    InfoRow(label: "Status", value: movie.status)
                }
            }
        } //VStack
    }
}


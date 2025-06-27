//
//  HomeView.swift
//  Movie-app
//
//  Created by Sami on 19/06/2025.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Propirites
    @ObservedObject private var viewModel: HomeViewModel
    
    // MARK: - Init
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 16) {
            
            welcomeHeaderView()
            
            MoviesTaps(selectedTab: $viewModel.selectedTab, isClicable: true)
                .padding(.horizontal, 8)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    selectedSectionView()
                    Spacer()
                } //Vstack
            } //Scroll
            .mainViewPadding(horizontalPadding: 16, topPadding: 20)
        } //VStack
        .background(Color.appPrimary)
        .onAppear {
            Task {
                await fetchMovies(for: viewModel.selectedTab)
            }
        }
        .onChange(of: viewModel.selectedTab) { newTab in
            Task {
                await fetchMovies(for: newTab)
            }
        }
    }
}

// MARK: - Subviews
private extension HomeView {
    
    /// Welcome Header View
    private func welcomeHeaderView() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            AppText(
                text: "Welcome 👋🏼",
                fontSize: 24,
                fontWeight: .bold
            )
            .foregroundColor(.appSecoundry)
            .padding(.horizontal, 16)
            .padding(.top, 8)
            
            Divider()
                .background(Color.appSecoundry.opacity(0.3))
                .padding(.horizontal, 16)
        } //VStack
    }
    
    /// Now Playing
    func nowPlayingSection() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            AppText(
                text: "Now Playing",
                textAlignment: .leading,
                fontSize: 20,
                fontWeight: .bold
            )
            .foregroundColor(.white)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(viewModel.nowPlayingMovies, id: \.id) { movie in
                        Button {
                            viewModel.showMovieDetails(movieID: movie.id)
                        } label: {
                            MoviePosterView(
                                movieImage: movie.posterPath,
                                movieName: movie.title,
                                releaseDate: movie.releaseDate
                            )
                        }
                    }
                } //HStack
            } //Scroll
        } //VStack
    }
    
    /// poular
    func popularMoviesSection() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            
            AppText(
                text: "Populars",
                textAlignment: .leading,
                fontSize: 20,
                fontWeight: .bold
            )
            .foregroundColor(.white)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(viewModel.popularMovies, id: \.id) { movie in
                        Button {
                            viewModel.showMovieDetails(movieID: movie.id)
                        } label: {
                            MoviePosterView(
                                movieImage: movie.posterPath,
                                movieName: movie.title,
                                releaseDate: movie.releaseDate
                            )
                        }
                    }
                } //HStack
            } //ScrollView
        } //VStack
    }
    
    ///upcoming
    func upcomingMoviesSection() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            
            AppText(
                text: "Upcoming",
                textAlignment: .leading,
                fontSize: 20,
                fontWeight: .bold
            )
            .foregroundColor(.white)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(viewModel.upcomingMovies, id: \.id) { movie in
                        Button {
                            viewModel.showMovieDetails(movieID: movie.id)
                        } label: {
                            MoviePosterView(
                                movieImage: movie.posterPath,
                                movieName: movie.title,
                                releaseDate: movie.releaseDate
                            )
                        }
                    }
                } //HStack
            } //Scroll
        } //Vstack
    }
    
    /// Fetch Movies func
    private func fetchMovies(for tab: HomeTab) async {
        switch tab {
        case .nowPlaying:
            if viewModel.nowPlayingMovies.isEmpty {
                await viewModel.getNowPlaying()
            }
        case .popular:
            if viewModel.popularMovies.isEmpty {
                await viewModel.getPopulars()
            }
        case .upcoming:
            if viewModel.upcomingMovies.isEmpty {
                await viewModel.getUpComing()
            }
        }
    }
}

//MARK: - TabEX
private extension HomeView {
    @ViewBuilder
    func selectedSectionView() -> some View {
        switch viewModel.selectedTab {
        case .nowPlaying:
            nowPlayingSection()
        case .popular:
            popularMoviesSection()
        case .upcoming:
            upcomingMoviesSection()
        }
    }
}

//#Preview {
//    HomeView()
//}

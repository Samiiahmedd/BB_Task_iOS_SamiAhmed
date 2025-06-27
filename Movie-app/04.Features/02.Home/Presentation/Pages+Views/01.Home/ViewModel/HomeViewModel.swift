//
//  HomeViewModel.swift
//  Movie-app
//
//  Created by Sami on 19/06/2025.
//

import Foundation

protocol HomeViewModelProtocol {
    /// Navigation functions
    func showMovieDetails(movieID: Int) 
    
}

class HomeViewModel: BaseViewModel {
    
    // MARK: - Properties
    /// Async
    @Published var isLoading: Bool = false
    @Published var nowPlayingMovies: [MovieDomain] = []
    @Published var popularMovies: [MovieDomain] = []
    @Published var upcomingMovies: [MovieDomain] = []
    @Published  var selectedTab: HomeTab = .nowPlaying
    
    private let coordinator: HomeCoordinatorProtocol
    private let repository: HomeRepository
    
    // MARK: - Init
    init(
        coordinator: HomeCoordinatorProtocol,
        repository: HomeRepository = HomeRepositoryImpl(dataSource: HomeRemoteDataSource())
    ) {
        self.coordinator = coordinator
        self.repository = repository
    }
}

// MARK: - Functions
extension HomeViewModel: HomeViewModelProtocol {
    
    func showMovieDetails(movieID: Int) {
        coordinator.showMovieDetailsPage(movieId: movieID)
    }
}

// MARK: - Network Calls
extension HomeViewModel {
    ///Populars
    @MainActor
    func getPopulars() async {
        isLoading = true
        defer { isLoading = false }
        do {
            let result = try await repository.getPopulars()
            popularMovies = result
        } catch {
            handelError(error) { errorMessage in
                print(errorMessage)
            }
        }
    }
    
    
    ///NowPlaying
    @MainActor
    func getNowPlaying() async {
        isLoading = true
        defer { isLoading = false }
        do {
            let result = try await repository.getNowPlaying()
            nowPlayingMovies = result
            
            
        } catch {
            handelError(error) { errorMessage in
                print(errorMessage)
            }
        }
    }
    
    ///UpComming
    @MainActor
    func getUpComing() async {
        isLoading = true
        defer { isLoading = false }
        do {
            let result = try await repository.getUpcomming()
            upcomingMovies = result
            
        } catch {
            handelError(error) { errorMessage in
                print(errorMessage)
            }
        }
    }
}

///Taps Enum
enum HomeTab: String, CaseIterable, Identifiable {
    case nowPlaying = "Now Playing"
    case popular = "Popular"
    case upcoming = "Upcoming"
    
    var id: String { self.rawValue }
    
    var title: String {
        switch self {
        case .nowPlaying: return "Now playing"
        case .popular: return "Populars"
        case .upcoming: return "Upcoming"
        }
    }
}

//
//  MovieDetailsViewModel.swift
//  Movie-app
//
//  Created by Sami on 19/06/2025.
//

import Foundation

@MainActor
protocol MovieDetailsViewModelProtocol {
    /// functions
    func getMovieDetails() async
}

final class MovieDetailsViewModel: BaseViewModel {
    
    // MARK: - Properties
    private let repository: HomeRepository
    private let coordinator: HomeCoordinatorProtocol
    private let movieID: Int
    
    ///Async
    @Published var isLoading: Bool = false
    @Published private(set) var movieDetails: MovieDetailsDomain?
    
    // MARK: - Init
    init(
        coordinator: HomeCoordinatorProtocol,
        repository: HomeRepository = HomeRepositoryImpl(dataSource: HomeRemoteDataSource()),
        movieID: Int
    ) {
        self.coordinator = coordinator
        self.repository = repository
        self.movieID = movieID
        super.init()
        Task {
            await getMovieDetails()
        }
    }
}

// MARK: - NetworkCalls
extension MovieDetailsViewModel: MovieDetailsViewModelProtocol {
    func getMovieDetails() async {
        isLoading = true
        defer { isLoading = false }
        do {
            let result = try await repository.getMovieDetails(id: movieID )
            movieDetails = result

        } catch {
            handelError(error) { errorMessage in
                print(errorMessage)
            }
        }
    }
}

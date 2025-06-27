//
//  HomeCoordinatorProtocol.swift
//  GoApp
//
//  Created by sami on 16/04/2025.
//

import SwiftUI

protocol HomeCoordinatorProtocol: Coordinator {
    func showHome()
    func showMovieDetailsPage(movieId: Int)
}

final class HomeCoordinator: HomeCoordinatorProtocol{
    
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        showHome()
    }
    
    // MARK: - Functions
    func showMovieDetailsPage(movieId: Int) {
        let view = MovieDetailsView(viewModel: MovieDetailsViewModel(coordinator: self, movieID: movieId))
        let viewController = UIHostingController(rootView: view)
        router.push(viewController)
    }
    
    func showHome() {
        let view = HomeView(viewModel: HomeViewModel(coordinator: self))
        let viewController = UIHostingController(rootView: view)
        router.push(viewController)
    }
}


//
//  HomeRepositoryImpl.swift
//  movie-app
//
//  Created by Sami on 25/06/2025.
//

import NetworkLayer

class HomeRepositoryImpl: HomeRepository {

    
    // MARK: - Properties
    let dataSource: HomeDataSource
    
    // MARK: - Init
    init(dataSource: HomeDataSource) {
        self.dataSource = dataSource
    }
    
    // MARK: - Functions
    func getPopulars() async throws -> [MovieDomain] {
        let movieEntity = try await dataSource.getPopulars()
        let movies = movieEntity.map { $0.toDomain() }
        return movies
    }
    
    func getUpcomming() async throws -> [MovieDomain] {
        let movieEntity = try await dataSource.getUpComing()
        let movies = movieEntity.map { $0.toDomain() }
        return movies
    }
    
    func getNowPlaying() async throws -> [MovieDomain] {
        let movieEntity = try await dataSource.getNowPlaying()
        let movies = movieEntity.map { $0.toDomain() }
        return movies
    }
    
    func getMovieDetails(id: Int) async throws -> MovieDetailsDomain {
        let response = try await dataSource.getMovieDetails(for: id)
        return response.toDomain()
    }
    
    
}

//
//  HomeRepository.swift
//  movie-app
//
//  Created by Abdel Azim Saleh on 28/04/2025.
//

protocol HomeRepository {
    func getPopulars()  async throws -> [MovieDomain]
    func getUpcomming() async throws -> [MovieDomain]
    func getNowPlaying() async throws -> [MovieDomain]
    
    func getMovieDetails(id: Int) async throws -> MovieDetailsDomain

}


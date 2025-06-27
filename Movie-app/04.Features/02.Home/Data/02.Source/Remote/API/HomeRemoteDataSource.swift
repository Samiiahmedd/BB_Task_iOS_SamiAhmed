//
//  HomeRemoteDataSource.swift
//  Movie-app
//
//  Created by Sami on 25/06/2025.
//

import Foundation
import NetworkLayer

final class HomeRemoteDataSource: BaseRemoteDataSource, HomeDataSource {
    
    func getPopulars() async throws -> [Movie] {
        let endPoint = HomeEndPoint.getPopulars
        let request = RequestModel(endPoint: endPoint)
        let response: MoviesResponse = try await network.requestWithBase(request)
        return response.results
    }
    
    func getNowPlaying() async throws -> [Movie] {
        let endPoint = HomeEndPoint.getNowPlaying
        let request = RequestModel(endPoint: endPoint)
        let response: MoviesResponse = try await network.requestWithBase(request)
        return response.results
    }
    
    func getUpComing() async throws -> [Movie] {
        let endPoint = HomeEndPoint.getUpcomming
        let request = RequestModel(endPoint: endPoint)
        let response: MoviesResponse = try await network.requestWithBase(request)
        return response.results
    }
    
    func getMovieDetails(for movieId: Int) async throws -> MovieDetailsEntity {
        let endPoint = HomeEndPoint.getMovieDetails(id: movieId)
        let request = RequestModel(endPoint: endPoint)
        let response: MovieDetailsEntity = try await network.requestWithBase(request)
        return try checkModelErrorResponse(response)
    }
    
}

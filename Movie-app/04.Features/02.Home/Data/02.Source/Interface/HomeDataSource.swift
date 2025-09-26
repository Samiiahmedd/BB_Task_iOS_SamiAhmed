//
//  HomeDataSource.swift
//  Movie-app
//
//  Created by Sami on 25/06/2025.
//

import Foundation

protocol HomeDataSource {
    
    func getPopulars()  async throws -> [Movie]
    func getNowPlaying() async throws -> [Movie]
    func getUpComing() async throws -> [Movie]
    
    func getMovieDetails(for movieId: Int) async throws -> MovieDetailsEntity

}

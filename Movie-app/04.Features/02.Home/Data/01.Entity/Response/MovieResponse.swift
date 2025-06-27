//
//  MovieResponse.swift
//  Movie-app
//
//  Created by Sami on 25/06/2025.
//

import Foundation

struct MoviesResponse: Codable {
    let dates: Dates?
    let page: Int?
    let results: [Movie]
    let totalPages: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Dates: Codable {
    let maximum: String?
    let minimum: String?
}

struct Movie: Codable, Identifiable {
    let id: Int?
    let adult: Bool?
    let backdropPath: String?
    let genreIds: [Int]
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, adult, overview, popularity, title, video
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

//
//  MovieMapper.swift
//  Movie-app
//
//  Created by Sami on 25/06/2025.
//

import Foundation

extension Movie {
    func toDomain() -> MovieDomain {
        .init(
            id: id,
            adult: adult ?? .defaultValue,
            backdropPath: backdropPath ?? .defaultValue,
            genreIds: genreIds,
            originalLanguage: originalLanguage ?? .defaultValue,
            originalTitle: originalTitle ?? .defaultValue,
            overview: overview ?? .defaultValue,
            popularity: popularity ?? .defaultValue,
            posterPath: posterPath ?? .defaultValue,
            releaseDate: releaseDate ?? .defaultValue,
            title: title ?? .defaultValue,
            video: video ?? .defaultValue,
            voteAverage: voteAverage ?? .defaultValue,
            voteCount: voteCount ?? .defaultValue
        )
    }
}

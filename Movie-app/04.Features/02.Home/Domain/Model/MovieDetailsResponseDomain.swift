//
//  MovieDetailsResponseDomain.swift
//  Movie-app
//
//  Created by Sami on 26/06/2025.
//

import Foundation

struct MovieDetailsDomain {
    let id: Int
    let adult: Bool
    let backdropPath: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int
    let genres: [GenreDomain]
    let productionCompanies: [ProductionCompanyDomain]
    let spokenLanguages: [LanguageDomain]
    let budget: Int
    let revenue: Int
    let tagline: String
    let status: String
    let homepage: String
    
    let belongsToCollection: CollectionDomain?
    let originCountry: [String]
    let productionCountries: [ProductionCountryDomain]
    let imdbId: String
}

struct GenreDomain {
    let id: Int
    let name: String
}

struct ProductionCompanyDomain {
    let id: Int
    let name: String
    let logoPath: String
    let originCountry: String
}

struct LanguageDomain {
    let englishName: String
    let iso6391: String
    let name: String
}

struct CollectionDomain {
    let id: Int
    let name: String
    let posterPath: String
    let backdropPath: String
}

struct ProductionCountryDomain {
    let iso31661: String
    let name: String
}

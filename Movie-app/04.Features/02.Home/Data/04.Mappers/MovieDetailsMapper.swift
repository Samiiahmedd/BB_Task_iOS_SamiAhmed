//
//  MovieDetailsMapper.swift
//  Movie-app
//
//  Created by Sami on 26/06/2025.
//

import Foundation

extension MovieDetailsEntity {
    func toDomain() -> MovieDetailsDomain {
        return MovieDetailsDomain(
            id: id ?? 0,
            adult: adult ?? false,
            backdropPath: backdropPath ?? "",
            originalLanguage: originalLanguage ?? "",
            originalTitle: originalTitle ?? "",
            overview: overview ?? "",
            popularity: popularity ?? 0.0,
            posterPath: posterPath ?? "",
            releaseDate: releaseDate ?? "",
            title: title ?? "",
            video: video ?? false,
            voteAverage: voteAverage ?? 0.0,
            voteCount: voteCount ?? 0,
            runtime: runtime ?? 0,
            genres: genres?.map { $0.toDomain() } ?? [],
            productionCompanies: productionCompanies?.map { $0.toDomain() } ?? [],
            spokenLanguages: spokenLanguages?.map { $0.toDomain() } ?? [],
            budget: budget ?? 0,
            revenue: revenue ?? 0,
            tagline: tagline ?? "",
            status: status ?? "",
            homepage: homepage ?? ""
        )
    }
}

extension GenreEntity {
    func toDomain() -> GenreDomain {
        return GenreDomain(
            id: id ?? 0,
            name: name ?? ""
        )
    }
}

extension ProductionCompanyEntity {
    func toDomain() -> ProductionCompanyDomain {
        return ProductionCompanyDomain(
            id: id ?? 0,
            name: name ?? "",
            logoPath: logoPath ?? "",
            originCountry: originCountry ?? ""
        )
    }
}

extension LanguageEntity {
    func toDomain() -> LanguageDomain {
        return LanguageDomain(
            englishName: englishName ?? "",
            iso6391: iso6391 ?? ""
        )
    }
}

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
            homepage: homepage ?? "",
            belongsToCollection: belongsToCollection?.toDomain(),
            originCountry: originCountry ?? [],
            productionCountries: productionCountries?.map { $0.toDomain() } ?? [],
            imdbId: imdbId ?? ""
        )
    }
}

extension GenreEntity {
    func toDomain() -> GenreDomain {
        GenreDomain(
            id: id ?? 0,
            name: name ?? ""
        )
    }
}

extension ProductionCompanyEntity {
    func toDomain() -> ProductionCompanyDomain {
        ProductionCompanyDomain(
            id: id ?? 0,
            name: name ?? "",
            logoPath: logoPath ?? "",
            originCountry: originCountry ?? ""
        )
    }
}

extension LanguageEntity {
    func toDomain() -> LanguageDomain {
        LanguageDomain(
            englishName: englishName ?? "",
            iso6391: iso6391 ?? "",
            name: name ?? ""
        )
    }
}

extension CollectionEntity {
    func toDomain() -> CollectionDomain {
        CollectionDomain(
            id: id ?? 0,
            name: name ?? "",
            posterPath: posterPath ?? "",
            backdropPath: backdropPath ?? ""
        )
    }
}

extension ProductionCountryEntity {
    func toDomain() -> ProductionCountryDomain {
        ProductionCountryDomain(
            iso31661: iso31661 ?? "",
            name: name ?? ""
        )
    }
}

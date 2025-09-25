protocol ErrorRepresentable {
    var success: Bool? { get }
    var statusMessage: String? { get }
}

struct MovieDetailsEntity: ErrorRepresentable, Codable {
    var success: Bool?
    var statusMessage: String?
    
    var id: Int?
    var adult: Bool?
    var backdropPath: String?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var popularity: Double?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?
    
    let runtime: Int?
    let genres: [GenreEntity]?
    let productionCompanies: [ProductionCompanyEntity]?
    let spokenLanguages: [LanguageEntity]?
    let budget: Int?
    let revenue: Int?
    let tagline: String?
    let status: String?
    let homepage: String?
    
    let belongsToCollection: CollectionEntity?
    let originCountry: [String]?
    let productionCountries: [ProductionCountryEntity]?
    let imdbId: String?
    
    enum CodingKeys: String, CodingKey {
        case success
        case statusMessage
        case id
        case adult
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case runtime
        case genres
        case productionCompanies = "production_companies"
        case spokenLanguages = "spoken_languages"
        case budget
        case revenue
        case tagline
        case status
        case homepage
        
        case belongsToCollection = "belongs_to_collection"
        case originCountry = "origin_country"
        case productionCountries = "production_countries"
        case imdbId = "imdb_id"
    }
}

struct GenreEntity: Codable {
    let id: Int?
    let name: String?
}

struct ProductionCompanyEntity: Codable {
    let id: Int?
    let name: String?
    let logoPath: String?
    let originCountry: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case logoPath = "logo_path"
        case originCountry = "origin_country"
    }
}

struct LanguageEntity: Codable {
    let englishName: String?
    let iso6391: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso6391 = "iso_639_1"
        case name
    }
}

struct CollectionEntity: Codable {
    let id: Int?
    let name: String?
    let posterPath: String?
    let backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}

struct ProductionCountryEntity: Codable {
    let iso31661: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case iso31661 = "iso_3166_1"
        case name
    }
}

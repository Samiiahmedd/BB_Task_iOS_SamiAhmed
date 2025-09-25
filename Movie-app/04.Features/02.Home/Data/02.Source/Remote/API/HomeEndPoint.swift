
//
//  HomeEndPoint.swift
//  Movie-app
//
//  Created by Sami on 25/06/2025.
//

import Foundation
import NetworkLayer

// MARK: - Cases
enum HomeEndPoint: EndPoint {
    
    /// Home
    case getNowPlaying
    case getPopulars
    case getUpcomming
    
    /// Details
    case getMovieDetails(id: Int)

}

// MARK: - Paths
extension HomeEndPoint {
    var clientName: String {
        "movie"
 }
    
    var path: String {
        switch self {
        case .getPopulars :
            return "popular"
        case .getNowPlaying:
            return "now_playing"
        case .getUpcomming:
            return "upcoming"
        case .getMovieDetails(let id):
            return "\(id)"
        }
    }
}

// MARK: - Method
extension HomeEndPoint {
    var method: HTTPMethod {
        .get
    }
}

// MARK: - Params
extension HomeEndPoint {
    var parameters: [URLQueryItem] {
        switch self {
        default: return []
        }
    }
}

// MARK: - Header
extension HomeEndPoint {
    var headers: Headers {
        return [
            "Accept-Language": currentLanguage ?? "en",
            "Authorization": "Bearer " + "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNWE5MThkZGJmYTlhZGFhMjBjNjFhZDUwMGZkNTkwZiIsIm5iZiI6MTY5ODY2Nzk3Mi45OCwic3ViIjoiNjUzZjlkYzRjOGE1YWMwMTNhODdlOGQ2Iiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.gYsWRUGt9DpEObexS6YVqo1hW9_GY0Pi-F8HLTMTbWI"
        ]
    }
}

//
//  NetworkError.swift
//  BGSoft
//
//  Created by Artem Kutasevich on 21.05.22.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case badURL
    case badJSON
    case noInternet
    
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "Bad URL"
        case .badJSON:
            return "Bad JSON. Can't load data"
        case .noInternet:
            return "No Internet. Please check your internet connetction"
        }
    }
}

//
//  NetworkManager.swift
//  BGSoft
//
//  Created by Artem Kutasevich on 21.05.22.
//

import Foundation

class NetworkManager {
    static let networkManager = NetworkManager()
    private init() { /* Singleton */ }
    
    private let baseURL = "http://dev.bgsoft.biz/task/credits.json"
    
    func fetchData(completion: @escaping (Result<NetworkResponse, NetworkError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let model = try? JSONDecoder().decode(NetworkResponse.self, from: data) else {
                completion(.failure(.badJSON))
                return
            }
            completion(.success(model))
        }.resume()
    }
}

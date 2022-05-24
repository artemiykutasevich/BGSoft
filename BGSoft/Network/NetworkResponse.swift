//
//  NetworkResponse.swift
//  BGSoft
//
//  Created by Artem Kutasevich on 21.05.22.
//

import Foundation

typealias NetworkResponse = [String : ImageAndUserInfo]

struct ImageAndUserInfo: Codable {
    let photoURL: String
    let userName: String
    let userURL: String
    
    enum CodingKeys: String, CodingKey {
        case photoURL = "photo_url"
        case userName = "user_name"
        case userURL = "user_url"
    }
}

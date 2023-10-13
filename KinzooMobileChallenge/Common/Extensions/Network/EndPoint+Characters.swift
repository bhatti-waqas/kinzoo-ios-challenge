//
//  EndPoint+Characters.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 14/10/2023.
//

import Networking

extension Endpoint {
    
    static let baseUrl = "https://rickandmortyapi.com"
    
    static func characters() -> Self {
        .init(baseURL: baseUrl, path: "/api/character")
    }
}

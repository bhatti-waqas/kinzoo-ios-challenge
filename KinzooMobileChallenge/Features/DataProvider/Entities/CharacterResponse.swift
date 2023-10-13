//
//  CharacterResponse.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 14/10/2023.
//

struct CharacterResponse: Decodable {
    let results: [Character]
    
    enum CodingKeys: CodingKey {
        case results
    }
}

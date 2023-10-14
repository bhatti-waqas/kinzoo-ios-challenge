//
//  Character.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 14/10/2023.
//

struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
    let episode: [String]
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case status
        case species
        case image
        case episode
    }
    
    static func makeDummy() -> Character {
        .init(id: 1, name: "Rick", status: "Alive", species: "Human", image: "", episode: [])
    }
}

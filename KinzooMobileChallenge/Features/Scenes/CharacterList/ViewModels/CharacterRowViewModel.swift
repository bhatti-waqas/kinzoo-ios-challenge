//
//  CharacterRowViewModel.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 14/10/2023.
//

import Foundation

struct CharacterRowViewModel: Hashable {
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
    let episodes: [String]
    
    var imageUrl: URL? {
        URL(string: image)
    }
    
    init(character: CharacterEntity) {
        id = character.id
        name = character.name
        status = character.status
        species = character.species
        image = character.image
        episodes = character.episode
    }
}

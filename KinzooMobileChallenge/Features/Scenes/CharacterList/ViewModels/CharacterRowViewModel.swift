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
    
    let screenTitle = StringKey.Generic.detailsScreenTitle.get()
    
    var imageUrl: URL? {
        URL(string: image)
    }
    
    init(character: Character) {
        id = character.id
        name = character.name
        status = character.status
        species = character.species
        image = character.image
        episodes = character.episode.map {
            let componnts = $0.components(separatedBy: "/")
            return componnts.last ?? "0"
        }
        
    }
    
    func episodeNumber(at index: Int) -> String {
        episodes[index]
    }
}

//
//  UserDefaultsStorage.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 15/10/2023.
//

import Foundation
import Extensions

final class UserDefaultStorage: LocalStorage {
    
    func fetchCharacters() -> [CharacterEntity]? {
        guard let data: Data = UserDefaults.Application.characters.get() else { return nil }
        guard let characters = try? JSONDecoder().decode([CharacterEntity].self, from: data) else { return nil}
        return characters
    }
    
    func persist(characters: [CharacterEntity]) {
        guard let data = try? JSONEncoder().encode(characters) else { return }
        UserDefaults.Application.characters.save(data)
    }
}

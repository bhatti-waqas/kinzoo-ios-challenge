//
//  UserDefaultsStorage.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 15/10/2023.
//

import Foundation
import Extensions

final class UserDefaultStroage: LocalStorage {
    
    func fetchCharacters() -> [Character]? {
        guard let data: Data = UserDefaults.Application.characters.get() else { return nil }
        guard let exchangeRate = try? JSONDecoder().decode([Character].self, from: data) else { return nil}
        return exchangeRate
    }
    
    func persist(characters: [Character]) {
        guard let data = try? JSONEncoder().encode(characters) else { return }
        UserDefaults.Application.characters.save(data)
    }
}

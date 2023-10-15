//
//  MockLocalStorage.swift
//  KinzooMobileChallengeTests
//
//  Created by Waqas Naseem on 15/10/2023.
//

@testable import KinzooMobileChallenge

final class MockLocalStorage: LocalStorage {
    
    var characters: [CharacterEntity]?
    var isPersistCalled: Bool = false
    
    func fetchCharacters() -> [CharacterEntity]? {
        characters
    }
    
    func persist(characters: [CharacterEntity]) {
        isPersistCalled = true
    }
}

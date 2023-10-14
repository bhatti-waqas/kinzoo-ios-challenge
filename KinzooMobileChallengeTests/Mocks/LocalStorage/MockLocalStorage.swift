//
//  MockLocalStorage.swift
//  KinzooMobileChallengeTests
//
//  Created by Waqas Naseem on 15/10/2023.
//

@testable import KinzooMobileChallenge

final class MockLocalStorage: LocalStorage {
    
    var characters: [Character]?
    var isPersistCalled: Bool = false
    
    func fetchCharacters() -> [Character]? {
        characters
    }
    
    func persist(characters: [Character]) {
        isPersistCalled = true
    }
}

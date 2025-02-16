//
//  MockCharactersUseCase.swift
//  KinzooMobileChallengeTests
//
//  Created by Waqas Naseem on 15/10/2023.
//

import Foundation
@testable import KinzooMobileChallenge

final class MockCharactersUseCase: CharacterUseCase {
    
    var fetchCharactersResult: Result<[CharacterEntity], Error>!
    
    func fetchCharacters() async throws -> [CharacterEntity] {
        switch fetchCharactersResult {
        case .success(let characters):
            return characters
        case .failure(let error):
            throw error
        default:
            preconditionFailure("The mock result for the function shall be populated.")
        }
    }
}

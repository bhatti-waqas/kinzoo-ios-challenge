//
//  CharacterUseCase.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 05/09/2023.
//

protocol CharacterUseCase {
    func fetchCharacters() async throws -> [Character]
}

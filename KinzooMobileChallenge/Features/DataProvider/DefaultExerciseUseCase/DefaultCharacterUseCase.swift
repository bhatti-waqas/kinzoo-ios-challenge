//
//  DefaultCharacterUseCase.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 14/10/2023.
//

import Networking

final class DefaultCharacterUseCase {
    // MARK: - Private Properties
    private let networkService: NetworkServiceProtocol
    private let cache: LocalStorage
    
    init(networkService: NetworkServiceProtocol, cache: LocalStorage) {
        self.networkService = networkService
        self.cache = cache
    }
}
// MARK: - Currency Use-case implementation
extension DefaultCharacterUseCase: CharacterUseCase {
    
    /// will fetch from cache first
    /// in order to provide offline support and cahcing
    func fetchCharacters() async throws -> [Character] {
        if let characters = cache.fetchCharacters() {
            return characters
        } else {
            let response: CharacterResponse = try await networkService.request(with: .characters())
            cache.persist(characters: response.results)
            return response.results
        }
    }
}

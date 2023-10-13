//
//  NetworkCharacterUseCase.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 14/10/2023.
//

import Networking

final class NetworkCharacterUseCase {
    // MARK: - Private Properties
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
}
// MARK: - Currency Use-case implementation
extension NetworkCharacterUseCase: CharacterUseCase {
    
    func fetchCharacters() async throws -> [Character] {
        let response: CharacterResponse = try await networkService.request(with: .characters())
        return response.results
    }
}

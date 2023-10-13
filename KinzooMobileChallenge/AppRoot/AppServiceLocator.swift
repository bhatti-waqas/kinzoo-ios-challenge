//
//  AppServiceLocator.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 14/10/2023.
//

import Networking

let ServiceLocator = AppServiceLocator.shared

/// AppServiceLocator` is responsible to create/manage all dependencies of the application.
final class AppServiceLocator {
    
    // MARK: - Class Property
    static let shared = AppServiceLocator()
    
    // MARK: - private Property
    private let characterUseCase: CharacterUseCase
    
    // MARK: - Init
    private init() {
        /// Register dependencies
        let networkService: NetworkService = NetworkService()
        characterUseCase = NetworkCharacterUseCase(networkService: networkService)
    }
    
    func characterListViewControllersFactory() -> CharacterListViewControllerFactory {
        CharacterListViewControllerFactory(characterUseCase: characterUseCase)
    }
}

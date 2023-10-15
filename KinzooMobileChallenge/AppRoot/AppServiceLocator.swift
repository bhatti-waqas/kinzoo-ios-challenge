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
    // Lazy Injection of dependencies
    private lazy var characterUseCase: CharacterUseCase = {
        let networkService: NetworkService = NetworkService()
        let cache: LocalStorage = UserDefaultStroage()
        return DefaultCharacterUseCase(networkService: networkService, cache: cache)
    }()
    
    func characterListViewControllersFactory() -> CharacterListViewControllerFactory {
        CharacterListViewControllerFactory(characterUseCase: characterUseCase)
    }
}

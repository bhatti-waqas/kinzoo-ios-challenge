//
//  CharactersCoordinator.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 14/10/2023.
//
import UIKit
import Coordinator
import SwiftUI

final class CharactersCoordinator: BaseCoordinator<AppNavigationController> {
    
    override func start() {
        let factory = ServiceLocator.characterListViewControllersFactory()
        let listViewController = factory.makeCharacterListViewController(with: self)
        rootViewController.pushViewController(listViewController, animated: true)
    }
}

// MARK: - Characters Navigator
extension CharactersCoordinator: CharactersNavigator {
    func showDetails(with viewModel: CharacterRowViewModel) {
        let detailsViewController = CharacterListViewControllerFactory.makeCharacterDetailsViewController(with: viewModel)
        rootViewController.pushViewController(detailsViewController, animated: true)
    }
}

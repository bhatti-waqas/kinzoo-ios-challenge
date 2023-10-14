//
//  CharactersCoordinatorTests.swift
//  KinzooMobileChallengeTests
//
//  Created by Waqas Naseem on 15/10/2023.
//

import XCTest
@testable import KinzooMobileChallenge

final class CharactersCoordinatorTests: XCTestCase {
    
    func testStart_PushesCharactersViewController() {
        // Given
        let mockNavigationController = MockNavigationController()
        let coordinator = CharactersCoordinator(rootViewController: mockNavigationController)
        
        // When
        coordinator.start()
        
        XCTAssertTrue(mockNavigationController.pushedViewController is CharacterListViewController)
    }

    func test_ShowCharacterDetails() {
        // Given
        let mockNavigationController = MockNavigationController()
        let coordinator = CharactersCoordinator(rootViewController: mockNavigationController)
        let viewModel = CharacterRowViewModel.makeDummy()
        // When
        coordinator.showDetails(with: viewModel)
        
        // then
        let pushedViewController = mockNavigationController.pushedViewController
        XCTAssertTrue(pushedViewController is CharacterDetailsViewController)
    }
}

final class MockNavigationController: AppNavigationController {
    
    var pushedViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
    }
}

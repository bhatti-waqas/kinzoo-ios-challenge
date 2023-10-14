//
//  MockCharacterNaivator.swift
//  KinzooMobileChallengeTests
//
//  Created by Waqas Naseem on 15/10/2023.
//

import Foundation
@testable import KinzooMobileChallenge

final class MockCharacterNaivator: CharactersNavigator {
    var showDetailsInvoked: Bool = false
    
    func showDetails(with viewModel: CharacterRowViewModel) {
        showDetailsInvoked = true
    }
}

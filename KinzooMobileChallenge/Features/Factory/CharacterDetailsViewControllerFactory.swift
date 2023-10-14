//
//  CharacterDetailsViewControllerFactory.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 15/10/2023.
//

import Foundation

final class CharacterDetailsViewControllerFactory {
    
    static func makeCharacterDetailsViewController(with viewModel: CharacterRowViewModel) -> CharacterDetailsViewController {
        let viewModel = CharacterDetailsViewModel(rowViewModel: viewModel)
        let details = CharacterDetailsViewController(with: viewModel)
        return details
    }
}

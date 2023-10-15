//
//  CharacterListViewControllerFactory.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 30/08/2023.
//

final class CharacterListViewControllerFactory {
    
    // MARK: - Private Properties
    private let characterUseCase: CharacterUseCase
    
    // MARK: - Init
    init(characterUseCase: CharacterUseCase) {
        self.characterUseCase = characterUseCase
    }
    
    func makeCharacterListViewController(with navigator: CharactersNavigator) -> CharacterListViewController {
        let viewModel = CharacterListViewModel(characterUseCase: characterUseCase, navigator: navigator)
        let characterListViewController =  CharacterListViewController(with: viewModel)
        return characterListViewController
    }
}

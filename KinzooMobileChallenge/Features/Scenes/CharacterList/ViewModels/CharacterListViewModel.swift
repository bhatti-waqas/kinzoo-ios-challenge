//
//  CharacterListViewModel.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 14/10/2023.
//

import Combine

enum ListViewState: Equatable {
    case idle
    case loading
    case showCharacters([CharacterRowViewModel])
    case showMessageWithTitle(message: String)
}

final class CharacterListViewModel {
    
    private var fetchingTask: Task<Void, Never>?
    let characterUseCase: CharacterUseCase
    let navigator: CharactersNavigator
    var characterRowViewModels: [CharacterRowViewModel] = []
    @Published private(set) var viewState: ListViewState = .idle
    
    let screenTitle = StringKey.Generic.screenTitle.get()
    
    init(characterUseCase: CharacterUseCase, navigator: CharactersNavigator) {
        self.characterUseCase = characterUseCase
        self.navigator = navigator
    }
    
    deinit {
        fetchingTask?.cancel()
    }
    
    func fetchCharactersTriggered() {
        fetchCharacters()
    }
    
    func showDetails(at index: Int) {
    }
}
// MARK: - Private methods
private extension CharacterListViewModel {
    
    func fetchCharacters() {
        viewState = .loading
        fetchingTask = Task { @MainActor in
            do {
                let characters = try await characterUseCase.fetchCharacters()
                if characters.isEmpty {
                    viewState = .showMessageWithTitle(message: StringKey.Error.emptyResultMessage.get())
                } else {
                    characterRowViewModels = prepareCharacters(characters: characters)
                    viewState = .showCharacters(characterRowViewModels)
                }
            } catch {
                viewState = .showMessageWithTitle(message: error.localizedDescription)
            }
        }
    }
    
    func prepareCharacters(characters: [Character]) -> [CharacterRowViewModel] {
        characters.map(makeCharacterRowViewModel(with:))
    }
    
    func makeCharacterRowViewModel(with character: Character) -> CharacterRowViewModel {
        .init(character: character)
    }
    
    func getCharacter(at index: Int) -> CharacterRowViewModel {
        characterRowViewModels[index]
    }
}

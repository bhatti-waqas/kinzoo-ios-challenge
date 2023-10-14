//
//  CharacterListViewModelTests.swift
//  KinzooMobileChallengeTests
//
//  Created by Waqas Naseem on 15/10/2023.
//

import Foundation
import Combine
import XCTest
@testable import KinzooMobileChallenge

final class CharacterListViewModelTests: XCTestCase {
    
    private var sut: CharacterListViewModel!
    private var mockUseCase: MockCharactersUseCase!
    private var mockNavigator: MockCharacterNaivator!
    
    private var cancel: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancel = Set()
        mockUseCase = MockCharactersUseCase()
        mockNavigator = MockCharacterNaivator()
        sut = CharacterListViewModel(characterUseCase: mockUseCase, navigator: mockNavigator)
    }
    
    override func tearDown() {
        sut = nil
        mockUseCase = nil
        mockNavigator = nil
        cancel = nil
        super.tearDown()
    }
    
    func test_viewModel_configuration() {
        XCTAssertEqual(sut.screenTitle, StringKey.Generic.listScreenTitle.get())
    }
    
    func testFetchCharactersTriggered_whenServerReturnSuccess_shouldHaveValidStates() {
        // Given
        let mockCharactersResponse = MockResponseBuilder.getMockCharactersResponse()
        mockUseCase.fetchCharactersResult = .success(mockCharactersResponse.results)
                
        // When
        sut.fetchCharactersTriggered()
        
        // Then
        XCTAssertEqual(sut.viewState, .loading)
        XCTExpect(toEventually: sut.viewState == .showCharacters(sut.characterRowViewModels))
    }
    
    func testFetchCharactersTriggered_whenServerReturnFailure_shouldHaveValidStates() {
        // Given
        struct ErrorMock: LocalizedError {
            var errorDescription: String? { "ErrorMock message description" }
        }
        let mockError = ErrorMock()
        mockUseCase.fetchCharactersResult = .failure(mockError)
        var errorMessage = ""
        
        sut.$viewState
            .dropFirst()
            .sink { viewState in
                if case .showMessageWithTitle(let message) = viewState {
                    errorMessage = message
                }
            }.store(in: &cancel)
                
        // When
        sut.fetchCharactersTriggered()
        // Then
        XCTExpect(toEventually: errorMessage == mockError.localizedDescription)
    }
    
    func testFetchCharactersTriggered_EmptyResult() {
        // Given
        let mockCharactersEmptyResults = MockResponseBuilder.getMockCharactersResponseWithEmptyResults()
        // Mock usecase with an response with empty results
        mockUseCase.fetchCharactersResult = .success(mockCharactersEmptyResults.results)
        
        // When
        sut.fetchCharactersTriggered()
        
        // Assert that the view state transitions to .loading and then to .showMessageWithTitle with the correct message
        XCTAssertEqual(sut.viewState, .loading)
        XCTExpect(toEventually: sut.viewState == .showMessageWithTitle(message: StringKey.Error.emptyResultMessage.get()))
    }
    
    func testShowCharacterDetails() {
        // Given
        let mockCharactersResponse = MockResponseBuilder.getMockCharactersResponse()
        sut.characterRowViewModels = mockCharactersResponse.results.map { CharacterRowViewModel(character: $0) }
        
        // When: Trigger the showCharacterDetails method
        sut.showDetails(at: 0)
        
        XCTExpect(toEventually: mockNavigator.showDetailsInvoked)
    }
}

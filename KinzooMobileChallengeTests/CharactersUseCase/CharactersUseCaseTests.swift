//
//  CharactersUseCaseTests.swift
//  KinzooMobileChallengeTests
//
//  Created by Waqas Naseem on 15/10/2023.
//

import XCTest
@testable import KinzooMobileChallenge

final class CharactersUseCaseTests: XCTestCase {
    
    var mockNetworkService: MockNetworkService!
    var mockCache: MockLocalStorage!
    
    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        mockCache = MockLocalStorage()
    }
    
    override func tearDown() {
        mockNetworkService = nil
        mockCache = nil
        super.tearDown()
    }

    func testFetchCharacters_when_not_cached_success() async throws {
        // Given
        let mockData = MockResponseBuilder.getMockCharactersData()
        mockNetworkService.result = .success(mockData)
        mockCache.characters = nil
        let useCase = DefaultCharacterUseCase(networkService: mockNetworkService, cache: mockCache)
        
        // When
        // Fetch from api with forceNetwork true
        let characters = try await useCase.fetchCharacters()
        
        // Then
        // Verify characters are fetched from network service
        XCTAssertTrue(mockNetworkService.requestCalled)
        XCTAssertTrue(mockCache.isPersistCalled)
        XCTAssertNotNil(characters)
    }
    
    func testFetchCharactersFromCache_success() async throws {
        // Given
        let mockData = MockResponseBuilder.getMockCharactersData()
        let mockCharacters = MockResponseBuilder.getMockCharactersResponse()
        mockNetworkService.result = .success(mockData)
        mockCache.characters = mockCharacters.results
        mockNetworkService.requestCalled = false
        let useCase = DefaultCharacterUseCase(networkService: mockNetworkService, cache: mockCache)
        
        // When
        // Fetch from api with forceNetwork true
        let characters = try await useCase.fetchCharacters()
        
        // Then
        // Verify characters are fetched from network service
        XCTAssertFalse(mockNetworkService.requestCalled)
        XCTAssertNotNil(characters)
    }
    
    func testFetchCharactersFailure() async throws {
        // Given
        struct ErrorMock: LocalizedError {
            var errorDescription: String? { "ErrorMock message description" }
        }
        let mockError = ErrorMock()
        mockNetworkService.result = .failure(mockError)
        let useCase = DefaultCharacterUseCase(networkService: mockNetworkService, cache: mockCache)
        
        // When
        do {
            _ = try await useCase.fetchCharacters()
            // This line should not be executed if the call fails
            XCTFail("Fetching characters should fail but did not.")
        } catch {
            // Then
            guard let error = error as? ErrorMock else {
                return XCTFail("Fetching characters should fail but did not.")
            }
            XCTAssertEqual(error.localizedDescription, mockError.localizedDescription, "Received error should match the expected error.")
        }
    }
}

//
//  MockResponseBuilder.swift
//  KinzooMobileChallengeTests
//
//  Created by Waqas Naseem on 15/10/2023.
//

import Foundation
@testable import KinzooMobileChallenge

final class MockResponseBuilder {
    
    static func getMockCharactersResponse() -> CharacterResponse {
        do {
            let path = Bundle(for: MockResponseBuilder.self).path(forResource: "characters_response", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return try JSONDecoder().decode(CharacterResponse.self, from: data)
        } catch {
            fatalError("Error: \(error)")
        }
    }
    
    static func getMockCharactersResponseWithEmptyResults() -> CharacterResponse {
        do {
            let path = Bundle(for: MockResponseBuilder.self).path(forResource: "characters_response_empty", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return try JSONDecoder().decode(CharacterResponse.self, from: data)
        } catch {
            fatalError("Error: \(error)")
        }
    }
    
    static func getMockCharactersData() -> Data {
        do {
            let path = Bundle(for: MockResponseBuilder.self).path(forResource: "characters_response", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return data
        } catch {
            fatalError("Error: \(error)")
        }
    }
}

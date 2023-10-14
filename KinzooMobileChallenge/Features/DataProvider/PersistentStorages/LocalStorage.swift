//
//  LocalStorage.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 15/10/2023.
//

import Foundation

protocol LocalStorage {
    func fetchCharacters() -> [Character]?
    func persist(characters: [Character])
}

//
//  CharacterDetailsViewModel.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 15/10/2023.
//

import Foundation

struct CharacterDetailsViewModel {
    
    enum DetailsSection: String {
        case MainInfo
        case Episodes
        
        func localizedName() -> String {
            switch self {
            case .MainInfo:
                return "MAIN INFO"
            case .Episodes:
                return "EPISODES"
            }
        }
    }
    private let sections: [DetailsSection] = [.MainInfo, .Episodes]
    private let rowViewModel: CharacterRowViewModel
    private let episodeNumbers: [String]
    
    let screenTitle = StringKey.Generic.detailsScreenTitle.get()
    
    
    var numberOfSections: Int {
        sections.count
    }
    
    var numberOfEpisodes: Int {
        rowViewModel.episodes.count
    }
    
    init(rowViewModel: CharacterRowViewModel) {
        self.rowViewModel = rowViewModel
        self.episodeNumbers = rowViewModel.episodes.map {
            let componnts = $0.components(separatedBy: "/")
            return componnts.last ?? "0"
        }
    }
    
    func getCharacterInfo() -> CharacterRowViewModel {
        rowViewModel
    }
    
    func getSection(at index: Int) -> DetailsSection {
        sections[index]
    }
    
    func getEpisodeNumber(at index: Int) -> String {
        episodeNumbers[index]
    }
    
    func getSectionTitle(at index: Int) -> String {
        sections[index].localizedName()
    }
    
    func numberOfRows(at section: Int) -> Int {
        let section = sections[section]
        switch section {
        case .MainInfo:
            return 1
        case .Episodes:
            return numberOfEpisodes
        }
    }
}

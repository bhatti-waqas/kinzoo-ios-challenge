//
//  CharacterDetailsViewController.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 14/10/2023.
//

import UIKit

final class CharacterDetailsViewController: UIViewController {

    private enum DetailsSection: String {
        case MainInfo = "MAIN INFO"
        case Episodes = "EPISODES"
    }
    
    private let ui: CharacterDetailsUI = CharacterDetailsUI()
    private let viewModel: CharacterRowViewModel
    
    private let detailSections: [DetailsSection] = [.MainInfo, .Episodes]
    
    init(with viewModel: CharacterRowViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ui.layout(in: self)
        configureUI()
    }
}

// MARK: - Private Methods
private extension CharacterDetailsViewController {
    
    func configureUI() {
        title = viewModel.screenTitle
        ui.tableView.dataSource = self
    }
}

extension CharacterDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let detailsSection = detailSections[section]
        return detailsSection.rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let detailsSection = detailSections[section]
        switch detailsSection {
        case .MainInfo:
            return 1
        case .Episodes:
            return viewModel.episodes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailsSection = detailSections[indexPath.section]
        switch detailsSection {
        case .MainInfo:
            let cell: MainInfoRow = tableView.dequeue(for: indexPath)
            cell.configure(with: viewModel)
            return cell
        case .Episodes:
            let cell: EpisodeRow = tableView.dequeue(for: indexPath)
            let episodeNumber = viewModel.episodeNumber(at: indexPath.row)
            cell.configure(with: episodeNumber)
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        detailSections.count
    }
}

//
//  CharacterDetailsViewController.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 14/10/2023.
//

import UIKit

final class CharacterDetailsViewController: UIViewController {

    private let ui: CharacterDetailsUI = CharacterDetailsUI()
    private let viewModel: CharacterDetailsViewModel
    
    init(with viewModel: CharacterDetailsViewModel) {
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
        viewModel.getSectionTitle(at: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = viewModel.getSection(at: indexPath.section)
        switch section {
        case .MainInfo:
            let cell: MainInfoRow = tableView.dequeue(for: indexPath)
            let info = viewModel.getCharacterInfo()
            cell.configure(with: info)
            return cell
        case .Episodes:
            let cell: EpisodeRow = tableView.dequeue(for: indexPath)
            let episodeNumber = viewModel.getEpisodeNumber(at: indexPath.row)
            cell.configure(with: episodeNumber)
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections
    }
}

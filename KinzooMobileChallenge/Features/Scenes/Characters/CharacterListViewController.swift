//
//  CharacterListViewController.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 14/10/2023.
//

import UIKit
import Combine

final class CharacterListViewController: UIViewController {
    
    // MARK: - Private Properties
    private lazy var dataSource = makeDataSource()
    private let ui = CharacterListUI()
    private let viewModel: CharacterListViewModel
    private var bindingCancellable: AnyCancellable?
    
    init(with viewModel: CharacterListViewModel) {
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
        bindViewModel()
        viewModel.fetchCharactersTriggered()
    }
}

// MARK: - Private Methods
private extension CharacterListViewController {
    
    func configureUI() {
        title = viewModel.screenTitle
        ui.tableView.delegate = self
    }
    
    func bindViewModel() {
        bindingCancellable = viewModel.$viewState.sink { [weak self] viewState in
            self?.render(viewState)
        }
    }
    
    func render(_ state: ListViewState) {
        switch state {
        case .idle:
            beginLoading()
        case .loading:
            beginLoading()
        case .showCharacters(let characters):
            show(characters)
        case let .showMessageWithTitle(message):
            endLoading()
            presentAlert(message)
        }
    }
    
    func beginLoading() {
        ui.spinner.startAnimating()
    }
    
    func endLoading() {
        ui.spinner.stopAnimating()
    }
}

// MARK: - TableView Diffable DataSource
extension CharacterListViewController {
    
    enum Section: CaseIterable {
        case characters
    }
    
    private func makeDataSource() -> UITableViewDiffableDataSource<Section, CharacterRowViewModel> {
        UITableViewDiffableDataSource(
            tableView: ui.tableView,
            cellProvider: { tableView, indexPath, character in
                let cell: CharacterCell = tableView.dequeue(for: indexPath)
                cell.configure(with: character)
                return cell
            })
    }
    
    private func show(_ characters: [CharacterRowViewModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, CharacterRowViewModel>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(characters, toSection: .characters)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - UITableViewDelegate
extension CharacterListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

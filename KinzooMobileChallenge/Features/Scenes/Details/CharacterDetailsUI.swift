//
//  CharacterDetailsUI.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 14/10/2023.
//

import UIKit

final class CharacterDetailsUI {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 30
        tableView.register(cell: MainInfoRow.self)
        tableView.register(cell: EpisodeRow.self)
        return tableView
    }()
    
    func layout(in viewController: UIViewController) {
        viewController.view.backgroundColor = .white
        addSubViews(in: viewController)
        setupConstraints()
    }
}

// MARK: - Private Methods
private extension CharacterDetailsUI {
    
    func addSubViews(in viewController: UIViewController) {
        [tableView].forEach(viewController.view.addSubview)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(50)
        }
    }
}

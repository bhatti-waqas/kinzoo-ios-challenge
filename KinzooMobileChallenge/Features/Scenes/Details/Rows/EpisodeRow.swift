//
//  EpisodeRow.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 14/10/2023.
//

import UIKit

final class EpisodeRow: UITableViewCell {
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var episodeNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirRegular, size: .standard(.h3))
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with episodeNumber: String) {
        episodeNumberLabel.text = episodeNumber
    }
}

// MARK: - Private Methods
private extension EpisodeRow {
    
    func addSubViews() {
        contentView.addSubview(stack)
        stack.addArrangedSubview(episodeNumberLabel)
    }
    
    func setupConstraints() {
        stack.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview().inset(10)
        }
    }
}

//
//  MainInfoRow.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 14/10/2023.
//

import UIKit

final class MainInfoRow: UITableViewCell {
    
    private lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private lazy var nameStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    private lazy var nameTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirDemiBold, size: .standard(.h3))
        label.text = StringKey.Generic.nameTitle.get()
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirRegular, size: .standard(.h3))
        return label
    }()
    
    private lazy var statusStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    private lazy var statusTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirDemiBold, size: .standard(.h3))
        label.text = StringKey.Generic.statusTitle.get()
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirRegular, size: .standard(.h3))
        return label
    }()
    
    private lazy var speciesStatck: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    private lazy var speciesTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirDemiBold, size: .standard(.h3))
        label.text = StringKey.Generic.speciesTitle.get()
        return label
    }()
    
    private lazy var speciesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirRegular, size: .standard(.h3))
        return label
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 20
        imgView.layer.masksToBounds = true
        return imgView
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
    
    func configure(with character: CharacterRowViewModel) {
        nameLabel.text = character.name
        statusLabel.text = character.status
        speciesLabel.text = character.species
        profileImageView.setImage(with: character.imageUrl)
    }
}
// MARK: - Private Methods
private extension MainInfoRow {
    
    func addSubViews() {
        contentView.addSubview(verticalStackView)
        [profileImageView, nameStack, statusStack, speciesStatck ].forEach(verticalStackView.addArrangedSubview)
        [nameTitleLabel, nameLabel].forEach(nameStack.addArrangedSubview)
        [statusTitleLabel, statusLabel].forEach(statusStack.addArrangedSubview)
        [speciesTitleLabel, speciesLabel].forEach(speciesStatck.addArrangedSubview)
    }
    
    func setupConstraints() {
        verticalStackView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
    }
}

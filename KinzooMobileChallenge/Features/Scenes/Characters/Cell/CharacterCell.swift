//
//  CharacterCell.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 30/08/2023.
//

import UIKit

final class CharacterCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        UIView()
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirDemiBold, size: .standard(.h3))
        return label
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.image = UIImage(named: "placeHolder")
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
        profileImageView.setImage(with: character.imageUrl)
    }
}
// MARK: - Private Methods
private extension CharacterCell {
    
    func addSubViews() {
        contentView.addSubview(containerView)
        [profileImageView, nameLabel].forEach(containerView.addSubview)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview().inset(10)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.width.equalTo(profileImageView.snp.height).multipliedBy(1.415)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.trailing.bottom.equalToSuperview().offset(10)
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
        }
    }
}

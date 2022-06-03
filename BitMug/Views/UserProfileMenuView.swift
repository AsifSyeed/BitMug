//
//  UserProfileMenuView.swift
//  BitMug
//
//  Created by BS901 on 6/2/22.
//

import UIKit

class UserProfileMenuView: UIView {

    var profileImageView: UIImageView = {
        
        $0.image = UIImage(named: "profilePicture")
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 20
        
        return $0
    }(UIImageView())
    
    var nameLabel: UILabel = {
        
        $0.font = .systemFont(ofSize: 26, weight: .regular)
        $0.textColor = .white
        
        return $0
    }(UILabel())
    
    var userStackView: UIStackView = {
        
        $0.axis = .horizontal
        $0.spacing = 15
        $0.alignment = .center
        $0.distribution = .equalSpacing
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIStackView())
    
    init(text: String) {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        
        nameLabel.text = text
        
        userStackView.addArrangedSubview(nameLabel)
        userStackView.addArrangedSubview(profileImageView)
        
        self.addSubview(userStackView)
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        let nameLabelConstraints = [
            nameLabel.heightAnchor.constraint(equalToConstant: 30.0)
        ]
        
        let profileImageConstraints = [
            profileImageView.heightAnchor.constraint(equalToConstant: 40.0),
            profileImageView.widthAnchor.constraint(equalToConstant: 40.0)
        ]
        
        let userStackViewConstraints = [
            userStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            userStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            userStackView.topAnchor.constraint(equalTo: self.topAnchor),
            userStackView.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(profileImageConstraints)
        NSLayoutConstraint.activate(userStackViewConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

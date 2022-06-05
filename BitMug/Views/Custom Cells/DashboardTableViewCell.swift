//
//  DashboardTableViewCell.swift
//  BitMug
//
//  Created by BS901 on 6/4/22.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {

    static let identifier = "DashboardTableViewCell"
    
    var primaryStackView: UIStackView = {
        
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.alignment = .fill
        $0.backgroundColor = UIColor.systemGray5
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 1
        
        return $0
    }(UIStackView())
    
    var topStackView: UIStackView = {
        
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .fill
        $0.spacing = 1
        
        $0.addArrangedSubview(DashBoardDataView())
        $0.addArrangedSubview(DashBoardDataView())
        
        return $0
        
    }(UIStackView())
    
    var bottomStackView: UIStackView = {
        
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .fill
        $0.spacing = 1
        $0.addArrangedSubview(DashBoardDataView())
        $0.addArrangedSubview(DashBoardDataView())
        
        return $0
        
    }(UIStackView())
    
    var containerView: UIView = {
       
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
        
    }(UIView())
    
    var shadowView: UIView = {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
        
    }(UIView())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        primaryStackView.addArrangedSubview(topStackView)
        primaryStackView.addArrangedSubview(bottomStackView)
        
        containerView.addSubview(primaryStackView)
        
        shadowView.addSubview(containerView)
        
        self.contentView.addSubview(shadowView)
        
        setConstraints()
    }
    
    private func setConstraints() {
        
        let containerViewConstraints = [
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20)
        ]
        
        let shadowViewConstraints = [
            shadowView.topAnchor.constraint(equalTo: containerView.topAnchor),
            shadowView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            shadowView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ]
        
        let primaryStackViewConstraints = [
            primaryStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            primaryStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            primaryStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            primaryStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(containerViewConstraints)
        NSLayoutConstraint.activate(shadowViewConstraints)
        NSLayoutConstraint.activate(primaryStackViewConstraints)
        
    }
    
    public func configuration() {
        
        self.backgroundColor = .clear
        
        containerView.clipsToBounds = true
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 20
        
        shadowView.clipsToBounds = false
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.1
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shouldRasterize = true
        shadowView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

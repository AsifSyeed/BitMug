//
//  DashboardUIView.swift
//  BitMug
//
//  Created by BS901 on 5/31/22.
//

import UIKit

class DashboardUIView: UIView {
    
    private let topHeaderView: UIView = {
        let topView = UIView()
        topView.contentMode = .scaleAspectFill
        topView.clipsToBounds = true
        topView.backgroundColor = .white
        
        return topView
    }()
    
    private let balanceView: UIView = {
        let view = UIView()
        
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = view.frame.size.width/2
        view.layer.borderColor = CGColor(gray: 9.0, alpha: 0.1)
        view.layer.borderWidth = 5.0
        
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(balanceView)
        addSubview(topHeaderView)
        applyConstraints()
    }
    
    private func applyConstraints() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topHeaderView.frame = frame.insetBy(dx: 15.0, dy: 15.0)
        topHeaderView.layer.cornerRadius = 20
        
        topHeaderView.layer.shadowColor = UIColor.black.cgColor
        topHeaderView.layer.shadowOffset = CGSize(width: 3, height: 3)
        topHeaderView.layer.shadowOpacity = 0.7
        topHeaderView.layer.shadowRadius = 4.0
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}


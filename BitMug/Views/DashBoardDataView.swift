//
//  DashBoardDataView.swift
//  BitMug
//
//  Created by BS901 on 6/4/22.
//

import UIKit

protocol DashboardDataViewDelegate: AnyObject {
    func homeTableViewReload()
}

class DashBoardDataView: UIView {
    
    static weak var delegate: DashboardDataViewDelegate?
    
    var randomCrypto: Crypto?
    
    weak var tempTableView: UITableView?
    
    var titleLabel: UILabel = {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 25, weight: .semibold)
        $0.textColor = .systemBlue
        
        return $0
        
    }(UILabel())
    
    var subTitleLabel: UILabel = {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.numberOfLines = 0
        $0.textColor = .systemBlue
        
        return $0
        
    }(UILabel())
    
    init() {
        
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        
        getRandomCryptoData()
        
        self.titleLabel.text = randomCrypto?.asset_id ?? "BTC"
        self.subTitleLabel.text = NSString(format: "%.2f", randomCrypto?.price_usd ?? 0.0) as String?
        
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        
        setConstraints()
    }
    
    private func setConstraints() {
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            titleLabel.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        let subTitleLabelConstraints = [
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -10),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(subTitleLabelConstraints)
    }
    
    private func getRandomCryptoData() {
        APICaller.shared.getAllCryptoData() { result in
            
            switch result {
                
            case .success(let cryptos):
                let selectedCrypto = cryptos.randomElement()
                self.randomCrypto = selectedCrypto
                
                DashBoardDataView.delegate?.homeTableViewReload()
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

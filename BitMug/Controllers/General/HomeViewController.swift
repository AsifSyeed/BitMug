//
//  ViewController.swift
//  BitMug
//
//  Created by BS901 on 5/30/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var profileNavBar: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UserProfileMenuView(text: "nemes1s"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        navigationController?.navigationBar.standardAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.left")!.withAlignmentRectInsets(.init(top: 0, left: -10, bottom: 0, right: 0)), transitionMaskImage: UIImage(systemName: "arrow.left")!.withAlignmentRectInsets(.init(top: 0, left: -10, bottom: 0, right: 0)))
        navigationController?.navigationBar.tintColor = UIColor.systemGray
        navigationItem.backButtonTitle = ""
        
        view.addSubview(profileNavBar)
        
        setBackground()
        applyHomeVCConstraints()
        
        fetchData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setBackground() {
        
        let bg = UIImage(named: "background")
        
        var imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = bg
        imageView.center = view.center
        
        view.addSubview(imageView)
        
        self.view.sendSubviewToBack(imageView)
    }
    
    func applyHomeVCConstraints() {
        let profileNavBarConstraints = [
            profileNavBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            profileNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            profileNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            profileNavBar.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(profileNavBarConstraints)
    }
    
    private func fetchData() {
        APICaller.shared.getAllCryptoData { results in
            
            switch results {
            case .success(let cryptos):
                print(cryptos)
            case .failure(let error):
                print(error)
            }
        }
    }
}

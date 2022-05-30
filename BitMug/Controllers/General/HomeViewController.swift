//
//  ViewController.swift
//  BitMug
//
//  Created by BS901 on 5/30/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = .systemRed
        navigationItem.rightBarButtonItem = UIBarButtonItem.navBarButtonItem(self, imageName: "bitcoinsign.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem.navBarButtonItem(self, imageName: "person.circle.fill")
    }
}

extension UIBarButtonItem {
    
    static func navBarButtonItem(_ target: Any?, imageName: String) -> UIBarButtonItem {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: imageName), for: .normal)
        
        let navBarItem = UIBarButtonItem(customView: button)
        navBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        
        
        navBarItem.customView?.heightAnchor.constraint(equalToConstant: 50).isActive = true
        navBarItem.customView?.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        return navBarItem
    }
}

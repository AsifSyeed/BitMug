//
//  extension.swift
//  BitMug
//
//  Created by BS901 on 5/31/22.
//

import Foundation
import UIKit

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


//
//  TabBarBaseViewController.swift
//  BitMug
//
//  Created by BS901 on 5/30/22.
//

import UIKit

class TabBarBaseViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: OffersViewController())
        let vc3 = UINavigationController(rootViewController: AccountViewController())
        let vc4 = UINavigationController(rootViewController: MenuViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house.fill")
        vc2.tabBarItem.image = UIImage(systemName: "gift.fill")
        vc3.tabBarItem.image = UIImage(systemName: "person.crop.circle.fill")
        vc4.tabBarItem.image = UIImage(systemName: "line.3.horizontal.circle.fill")
        
        vc1.title = "Home"
        vc2.title = "Offers"
        vc3.title = "Account"
        vc4.title = "Menu"
        
        tabBar.backgroundColor = .systemTeal
        tabBar.tintColor = .white
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
}

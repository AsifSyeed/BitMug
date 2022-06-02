//
//  MainTabBarController.swift
//  BitMug
//
//  Created by BS901 on 6/2/22.
//

import UIKit

class MainTabBarController: UITabBarController {

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
        
        tabBar.backgroundColor = .systemTeal
        tabBar.tintColor = .white
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

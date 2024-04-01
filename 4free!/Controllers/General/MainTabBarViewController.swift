//
//  MainTabBarViewController.swift
//  4free!
//
//  Created by Leonardo Macedo on 21/02/24.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: CategoryViewController())
        let vc3 = UINavigationController(rootViewController: BrowseGamesViewController())
        let vc4 = UINavigationController(rootViewController: FavoriteViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "list.bullet")
        vc3.tabBarItem.image = UIImage(systemName: "safari")
        vc4.tabBarItem.image = UIImage(systemName: "star")
        
        vc1.title = "Home"
        vc2.title = "Category"
        vc3.title = "Browse Games"
        vc4.title = "Favorite"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        
    }
    
}

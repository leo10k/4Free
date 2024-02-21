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
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        let vc3 = UINavigationController(rootViewController: CategoryViewController())
        let vc4 = UINavigationController(rootViewController: BrowseGamesViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc3.tabBarItem.image = UIImage(systemName: "list.bullet")
        vc4.tabBarItem.image = UIImage(systemName: "safari")
        
        vc1.title = "Home"
        vc2.title = "Search"
        vc3.title = "Category"
        vc4.title = "Browse Games"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        
    }
    
}

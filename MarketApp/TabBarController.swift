//
//  TabBarController.swift
//  MarketApp
//
//  Created by Naciye Celenli on 16.02.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabs()
    }
    
    private func configureTabs() {
        
        let vc1 = HomeViewController()
        let vc2 = CartViewController()
        let vc3 = FavoritesViewController()
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "cart")
        vc3.tabBarItem.image = UIImage(systemName: "star")
        
        vc1.title = "Home"
        vc2.title = "Cart"
        vc3.title = "Favorites"
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        
        setViewControllers([nav1,nav2,nav3], animated: true)
        
    }
    
}

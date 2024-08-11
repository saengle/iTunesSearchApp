//
//  TabbarController.swift
//  iTunes
//
//  Created by 쌩 on 8/11/24.
//

import UIKit

import Kingfisher

// MARK:   Main Tabbar
final class TabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let search = SearchViewController()
        let searchNav = UINavigationController(rootViewController: search)
        searchNav.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass.fill"))
        
        setViewControllers([ searchNav], animated: true)
    }
}

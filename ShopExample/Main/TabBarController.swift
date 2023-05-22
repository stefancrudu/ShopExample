//
//  TabBarController.swift
//  ShopExample
//
//  Created by Stefan Crudu on 14.05.2023.
//

import UIKit

protocol TabBarProtocol: UIViewController {
    var titleTabBar: String { get }
    var iconTabBar: UIImage { get }
}

final class TabBarController: UITabBarController {
    private var screens: [TabBarProtocol] = [
        HomeView(),
        CategoriesViewController(),
        CartView(),
        FavoriteView(),
        MyAccountView()
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setTabHeight()
    }
}

private extension TabBarController {
    func configureTabBar() {
        viewControllers = screens.map(createNavController)
        tabBar.backgroundColor = UIConstants.tabBarBackgorundColor
        tabBar.tintColor = UIConstants.tabBarTintColor
    }
    
    func setTabHeight() {
        tabBar.frame.size.height = UIConstants.tabBarHeight
        tabBar.frame.origin.y = view.frame.height - UIConstants.tabBarHeight
    }
    
    func createNavController(for rootViewController: TabBarProtocol) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = rootViewController.titleTabBar
        navController.tabBarItem.image = rootViewController.iconTabBar
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = rootViewController.title
        return navController
    }
}

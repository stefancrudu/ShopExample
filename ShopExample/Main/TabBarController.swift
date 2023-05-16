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
    private var screens: [UIViewController] = [
        HomeView(),
        CategoriesViewController(),
        CartView(),
        FavoriteView(),
        MyAccountView()
    ]
    
    private var createNavControllerFromScreens: [UIViewController]? {
        screens.map { screen in
            guard let screen = screen as? TabBarProtocol else {
                fatalError("One or more screens are not implementing TabBarProtocol")
            }
            return createNavController(for: screen)
        }
    }
        
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
        viewControllers = createNavControllerFromScreens
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

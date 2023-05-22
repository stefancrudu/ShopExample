//
//  HomeScreenView.swift
//  ShopExample
//
//  Created by Stefan Crudu on 14.05.2023.
//

import UIKit

class HomeView: UIViewController, TabBarProtocol {
    var titleTabBar: String = TabBarString.homeTitleBar.localized
    var iconTabBar: UIImage = UIImage(systemName: UIConstants.homeIconTabBarString)!
    
    override func viewDidLoad() {
        title = titleTabBar
    }
}

//
//  FavoriteView.swift
//  ShopExample
//
//  Created by Stefan Crudu on 14.05.2023.
//

import UIKit

class FavoriteView: UIViewController, TabBarProtocol {
    var titleTabBar: String = TabBarString.favoritesTitleBar.localized
    var iconTabBar: UIImage = UIImage(systemName: UIConstants.favoritesIconTabBarString)!
    
    override func viewDidLoad() {
        title = titleTabBar
    }
}



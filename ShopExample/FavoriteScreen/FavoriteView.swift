//
//  FavoriteView.swift
//  ShopExample
//
//  Created by Stefan Crudu on 14.05.2023.
//

import UIKit

class FavoriteView: UIViewController, TabBarProtocol {
    var titleTabBar: String = StringConstants.favoritesTitleBar
    var iconTabBar: UIImage = UIConstants.favoritesIconTabBar
    
    override func viewDidLoad() {
        title = titleTabBar
    }
}



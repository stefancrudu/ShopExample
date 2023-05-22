//
//  CartView.swift
//  ShopExample
//
//  Created by Stefan Crudu on 14.05.2023.
//
import UIKit

class CartView: UIViewController, TabBarProtocol {
    var titleTabBar: String = TabBarString.cartTitleBar.localized
    var iconTabBar: UIImage = UIImage(systemName: UIConstants.cartIconTabBarString)!
    
    override func viewDidLoad() {
        title = titleTabBar
    }
}



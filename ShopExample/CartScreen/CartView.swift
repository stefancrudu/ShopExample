//
//  CartView.swift
//  ShopExample
//
//  Created by Stefan Crudu on 14.05.2023.
//
import UIKit

class CartView: UIViewController, TabBarProtocol {
    var titleTabBar: String = StringConstants.cartTitleBar
    var iconTabBar: UIImage = UIConstants.cartIconTabBar
    
    override func viewDidLoad() {
        title = titleTabBar
    }
}



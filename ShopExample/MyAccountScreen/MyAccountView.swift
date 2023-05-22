//
//  MyAccountView.swift
//  ShopExample
//
//  Created by Stefan Crudu on 14.05.2023.
//

import UIKit

class MyAccountView: UIViewController, TabBarProtocol {
    var titleTabBar: String = TabBarString.myAccountTitleBar.localized
    var iconTabBar: UIImage = UIImage(systemName: UIConstants.myAccountIconTabBarString)!
    
    override func viewDidLoad() {
        title = titleTabBar
    }
}



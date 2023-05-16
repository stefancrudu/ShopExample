//
//  HomeScreenView.swift
//  ShopExample
//
//  Created by Stefan Crudu on 14.05.2023.
//

import UIKit

class HomeView: UIViewController, TabBarProtocol {
    var titleTabBar: String = StringConstants.homeTitleBar
    var iconTabBar: UIImage = UIConstants.homeIconTabBar
    
    override func viewDidLoad() {
        title = titleTabBar
    }
}

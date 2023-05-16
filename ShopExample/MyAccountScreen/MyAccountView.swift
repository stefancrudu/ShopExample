//
//  MyAccountView.swift
//  ShopExample
//
//  Created by Stefan Crudu on 14.05.2023.
//

import UIKit

class MyAccountView: UIViewController, TabBarProtocol {
    var titleTabBar: String = StringConstants.myAccountTitleBar
    var iconTabBar: UIImage = UIConstants.myAccountIconTabBar
    
    override func viewDidLoad() {
        title = titleTabBar
    }
}



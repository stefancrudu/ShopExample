//
//  UIConstants.swift
//  ShopExample
//
//  Created by Stefan Crudu on 14.05.2023.
//
import UIKit

struct UIConstants {}

// MARK: Margins
 
extension UIConstants {
    static let marginMinimum: CGFloat = 5
    static let marginHalf: CGFloat = 10
    static let marginThreeQuarters: CGFloat = 15
    static let marginMax: CGFloat = 20
}

// MARK: Radius
 
extension UIConstants {
    static let cornerRaiuds: CGFloat = 10
}

// MARK: Border

extension UIConstants {
    static let minBorderWidth: CGFloat = 1.0
}

// MARK: Icons

extension UIConstants {
    static let homeIconTabBar: UIImage = UIImage(systemName: "house.fill")!
    static let productsIconTabBar: UIImage = UIImage(systemName: "list.bullet")!
    static let cartIconTabBar: UIImage = UIImage(systemName: "cart")!
    static let favoritesIconTabBar: UIImage = UIImage(systemName: "star.fill")!
    static let myAccountIconTabBar: UIImage = UIImage(systemName: "person.fill")!
}

// MARK: Tab Bar Style

extension UIConstants {
    static let tabBarHeight: CGFloat = 88
    static let tabBarBackgorundColor: UIColor = .systemBackground
    static let tabBarTintColor: UIColor = .label
}

// MARK: Product List Colection View on 2 columns

extension UIConstants {
    static let numberOfLinesForTitleLabelFromProductList = 2
    static let numberOfColumnsForProductsList: CGFloat = 2
    static let cellHightForProductsList: CGFloat = 250
    static let addToCartBattonColor: UIColor = .red
    static let productListItemShodowColor: CGColor = UIColor.black.cgColor
    static let productListItemShadowOffset = CGSize(width: 0, height: 2)
    static let productListItemShadowRadius = 3.0
    static let productListItemShadowOpacity:Float = 0.5
}


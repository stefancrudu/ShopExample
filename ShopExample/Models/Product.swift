//
//  Product.swift
//  ShopExample
//
//  Created by Stefan Crudu on 11.05.2023.
//

import UIKit

struct Product: Codable, Hashable {
    let id: Int?
    let title: String
    let price: Double
    let category: String
    let description: String
    let image: String
}

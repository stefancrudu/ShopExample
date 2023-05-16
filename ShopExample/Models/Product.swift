//
//  Product.swift
//  ShopExample
//
//  Created by Stefan Crudu on 11.05.2023.
//

import Foundation

struct Product: Codable {
    let id: Int?
    let title: String
    let category: String
    let description: String
    let image: String
}

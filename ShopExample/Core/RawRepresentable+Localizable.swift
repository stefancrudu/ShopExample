//
//  String+Localizable.swift
//  ShopExample
//
//  Created by Stefan Crudu on 22.05.2023.
//

import Foundation

extension RawRepresentable where RawValue == String {
    var localized: String {
        NSLocalizedString(String(describing: Self.self) + "_\(rawValue)", comment: "")
    }
}

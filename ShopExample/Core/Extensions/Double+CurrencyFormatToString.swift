//
//  Double+CurrencyFormatToString.swift
//  ShopExample
//
//  Created by Stefan Crudu on 22.05.2023.
//

import Foundation

extension Double {
    var currencyFormatToString: String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale =  Locale.current

        return currencyFormatter.string(from: self as NSNumber) ?? ""
    }
}

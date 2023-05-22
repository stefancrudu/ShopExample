//
//  UIImageView.swift
//  ShopExample
//
//  Created by Stefan Crudu on 22.05.2023.
//

import UIKit

extension UIImageView {
    func setImage(stringUrl: String, placeholder: UIImage? = nil) {
        image = placeholder
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: stringUrl) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self?.image = UIImage(data: data)
            }
        }
    }
}


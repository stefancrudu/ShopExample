//
//  WrapperView.swift
//  ShopExample
//
//  Created by Stefan Crudu on 22.05.2023.
//

import UIKit

final class WrapperView<T: UIView>: UIView {
    let content: T
    
    init(content: T, insets: UIEdgeInsets, frame: CGRect = .zero) {
        self.content = content
        super.init(frame: frame)
        addSubview(content)
        content.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            content.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left),
            content.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insets.right),
            content.topAnchor.constraint(equalTo: topAnchor, constant: insets.top),
            content.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insets.bottom),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

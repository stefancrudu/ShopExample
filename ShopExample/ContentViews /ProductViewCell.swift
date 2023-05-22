//
//  ProductListItemView.swift
//  ShopExample
//
//  Created by Stefan Crudu on 16.05.2023.
//

import UIKit

class ProductViewCell: UICollectionViewCell {
    static let identifier = "product-list-item"
    
    let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = UIConstants.numberOfLinesForTitleLabelFromProductList
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var button: UIButton = {
        let button = UIButton()
        button.setTitle(StringConstants.addToCart, for: .normal)
        button.backgroundColor = UIConstants.addToCartBattonColor
        button.layer.cornerRadius = UIConstants.cornerRaiuds
        return button
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let contentWrapperView: WrapperView<UIStackView> = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = UIConstants.marginMinimum
        return WrapperView(content: stackView, insets: .init(top: UIConstants.marginMinimum, left: UIConstants.marginMinimum, bottom: UIConstants.marginMinimum, right: UIConstants.marginMinimum))
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
  
    private func configure() {
        contentView.layer.cornerRadius = UIConstants.cornerRaiuds
        contentView.layer.borderWidth = UIConstants.minBorderWidth
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .white
        
        layer.shadowColor = UIConstants.productListItemShodowColor
        layer.shadowOffset = UIConstants.productListItemShadowOffset
        layer.shadowRadius = UIConstants.productListItemShadowRadius
        layer.shadowOpacity = UIConstants.productListItemShadowOpacity
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(contentWrapperView)
        contentWrapperView.content.addArrangedSubview(titleLabel)
        contentWrapperView.content.addArrangedSubview(priceLabel)
        contentWrapperView.content.addArrangedSubview(button)
      
        titleLabel.setContentCompressionResistancePriority(.init(751), for: .vertical)
        button.setContentCompressionResistancePriority(.init(752), for: .vertical)
                
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}


//
//  ProductsListView.swift
//  ShopExample
//
//  Created by Stefan Crudu on 16.05.2023.
//

import UIKit

class ProductsListView: UICollectionViewController {
    private let category: String
    
    init(category: String) {
        self.category = category
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.showsSeparators = false
        let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        super.init(collectionViewLayout: listLayout)
    }

    required init?(coder: NSCoder) {
        fatalError("Always initialize ReminderViewController using init(reminder:)")
    }

    override func viewDidLoad() {
        title = category
    }
}

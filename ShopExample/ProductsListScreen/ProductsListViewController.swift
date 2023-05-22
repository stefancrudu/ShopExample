//
//  ProductsListView.swift
//  ShopExample
//
//  Created by Stefan Crudu on 16.05.2023.
//

import UIKit

class ProductsListViewController: UICollectionViewController {
    private typealias DataSource = UICollectionViewDiffableDataSource<Int, Product>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Product>
    
    private let category: String
    private var productsList: [Product] = []
    
    private let layout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = UIConstants.marginHalf
        layout.minimumInteritemSpacing = UIConstants.marginMinimum
        layout.itemSize = CGSizeMake((UIScreen.main.bounds.width / UIConstants.numberOfColumnsForProductsList) - (layout.minimumInteritemSpacing * UIConstants.numberOfColumnsForProductsList + 1), UIConstants.cellHightForProductsList)
        return layout
    }()
    
    private lazy var dataSource: DataSource! = {
        let cellRegistration = UICollectionView.CellRegistration<ProductViewCell, Product> {
            cell, indexPath, product in
            cell.titleLabel.text = self.productsList[indexPath.row].title
            cell.imageView.setImage(stringUrl: self.productsList[indexPath.row].image)
            cell.priceLabel.text = self.productsList[indexPath.row].price.currencyFormatToString
            cell.button.tag = self.productsList[indexPath.row].id ?? 0
            cell.button.addTarget(self, action: #selector(self.addToCartAction), for: .touchUpInside)
        }
        return DataSource(collectionView: collectionView, cellProvider: {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Product) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
       })
    }()
    
    init(category: String) {
        self.category = category
        super.init(collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
        fatalError("Always initialize ReminderViewController using init(reminder:)")
    }
   
    override func viewDidLoad() {
        title = category.capitalized
        configureCollectionView()
        setProductsList()
    }
}

//MARK: DataSource

private extension ProductsListViewController {
    func updateSnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(productsList)
        dataSource.apply(snapshot)
        collectionView.dataSource = dataSource
    }
}

// MARK: Actions

extension ProductsListViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("TO DO: Show product with id \(productsList[indexPath.row].id ?? 0)")
    }
    
    @objc private func addToCartAction(sender: UIButton) {
        print("TO DO: Add to cart \(sender.tag)")
    }
}

// MARK: Layout

private extension ProductsListViewController {
    func configureCollectionView() {
        collectionView.contentInset = UIEdgeInsets(top: UIConstants.marginMinimum, left: UIConstants.marginMinimum, bottom: UIConstants.marginMinimum, right: UIConstants.marginMinimum)
    }
}

//MARK: Networking

private extension ProductsListViewController {
    func setProductsList() {
        let services = ProductsService()
        Task {
            let result = await services.getProductsByCategory(category)
            switch result {
            case .success(let products):
                print(products)
                productsList = products
                updateSnapshot()
            case .failure(let error):
                print(error)
            }
        }
    }
}

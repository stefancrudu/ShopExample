//
//  CategoriesScreen.swift
//  ShopExample
//
//  Created by Stefan Crudu on 14.05.2023.
//

import UIKit

class CategoriesViewController: UICollectionViewController, TabBarProtocol {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    var titleTabBar: String = StringConstants.productsTitleBar
    var iconTabBar: UIImage = UIConstants.productsIconTabBar
    
    private lazy var dataSource: DataSource! = {
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        return DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
           return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
       })
    }()
    
    private var categoriesList: [String] = []
    
    init() {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        super.init(collectionViewLayout: listLayout)
        self.setCategoriesList()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = StringConstants.categoriesTitle
        
        if (categoriesList.isEmpty) {
            setCategoriesList(priority: .high)
        }
        updateSnapshot()
    }
}

//MARK: DataSource

private extension CategoriesViewController {
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) {
        let categoryName = self.categoriesList[indexPath.item]
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = categoryName
        cell.contentConfiguration = contentConfiguration
        cell.accessories = [
            .disclosureIndicator(displayed: .always)
        ]
    }
    
    func updateSnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(categoriesList)
        dataSource.apply(snapshot)
        collectionView.dataSource = dataSource
    }
}


//MARK: Actions

extension CategoriesViewController {
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        pushProductsList(for: categoriesList[indexPath.row])
        return false
    }
}


//MARK: Networking

private extension CategoriesViewController {
    func setCategoriesList(priority: TaskPriority = .background) {
        let services = CategoriesService()
        Task(priority: priority) {
            let result = await services.getAllCategories()
            switch result {
            case .success(let categories):
                print(categories)
                categoriesList = categories
            case .failure(let error):
                //TO DO: Show alert message
                print(error)
            }
        }
    }
}


//MARK: Navigation

private extension CategoriesViewController {
    func pushProductsList(for category:String) {
        let viewController = ProductsListView(category: category)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

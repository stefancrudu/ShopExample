//
//  ProductEndpoint.swift
//  ShopExample
//
//  Created by Stefan Crudu on 11.05.2023.
//

enum ProductsEndpoint {
    case all
    case productDetail(id: Int)
    case productsByCategory(name: String)
}

extension ProductsEndpoint: Endpoint {
    var path: String {
        switch self {
        case .all:
            return Configuration.allProductsPath
        case .productDetail(let id):
            return "\(Configuration.productDetailPath)\(id)"
        case .productsByCategory(let name):
            return "\(Configuration.productsByCategoryPath)\(name)"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .all, .productDetail, .productsByCategory:
            return .get
        }
    }
    
    var body: [String : String]? {
        return nil
        
    }
}

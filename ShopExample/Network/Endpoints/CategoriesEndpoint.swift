//
//  CategoriesEndpoint.swift
//  ShopExample
//
//  Created by Stefan Crudu on 15.05.2023.
//

import Foundation


enum CategoriesEndpoint {
    case all
}

extension CategoriesEndpoint: Endpoint {
    var path: String {
        switch self {
        case .all:
            return Configuration.allCategoriesPath
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .all:
            return .get
        }
    }
    
    var body: [String : String]? {
        return nil
        
    }
}

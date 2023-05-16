//
//  CategoryService.swift
//  ShopExample
//
//  Created by Stefan Crudu on 15.05.2023.
//

import Foundation

protocol CategoriesServiceable {
    func getAllCategories() async -> Result<[String], RequestError>
}


struct CategoriesService: HTTPClient, CategoriesServiceable {
    func getAllCategories() async -> Result<[String], RequestError> {
        return await sendRequest(endpoint: CategoriesEndpoint.all, responseModel: [String].self)
    }
}

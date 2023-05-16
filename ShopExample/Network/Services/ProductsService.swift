//
//  Services.swift
//  ShopExample
//
//  Created by Stefan Crudu on 12.05.2023.
//

import Foundation

protocol ProductsServiceable {
    func getAllProducts() async -> Result<[Product], RequestError>
    func getProductDetail(for id:Int) async -> Result<Product, RequestError>
}


struct ProductsService: HTTPClient, ProductsServiceable {
    func getAllProducts() async -> Result<[Product], RequestError> {
        return await sendRequest(endpoint: ProductsEndpoint.all, responseModel: [Product].self)
    }
    
    func getProductDetail(for id:Int) async -> Result<Product, RequestError> {
        return await sendRequest(endpoint: ProductsEndpoint.productDetail(id: id), responseModel: Product.self)
    }
    
    func getProductsByCategory(_ category: String) async -> Result<[Product], RequestError> {
        return await sendRequest(endpoint: ProductsEndpoint.productsByCategory(name: category), responseModel: [Product].self)
    }
}

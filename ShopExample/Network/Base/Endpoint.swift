//
//  Endpoint.swift
//  ShopExample
//
//  Created by Stefan Crudu on 11.05.2023.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var scheme: String {
        return  Configuration.apiScheme
    }
    
    var host: String {
        return Configuration.apiHost
    }
}

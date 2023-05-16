//
//  RequestError.swift
//  ShopExample
//
//  Created by Stefan Crudu on 11.05.2023.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unexpectedStatusCode
    case unknown
     
    var message: String  {
        switch self {
        case .decode:
            return ErrorMessages.decode.description
        case .noResponse:
            return ErrorMessages.noResponse.description
        case .unexpectedStatusCode:
            return ErrorMessages.unexpectedStatusCode.description
        default:
            return ErrorMessages.unknown.description
        }
    }
}

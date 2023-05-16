//
//  ErrorMessages.swift
//  ShopExample
//
//  Created by Stefan Crudu on 14.05.2023.
//

import Foundation

enum ErrorMessages {
    case unknown
    case unexpectedStatusCode
    case noResponse
    case decode
    
    var description: String {
        switch self {
        case .unknown:
            return NSLocalizedString("Unknown error from network.", comment: "Alert user with message unknown error from network request")
        case .unexpectedStatusCode:
            return NSLocalizedString("I recive an unexpected status code.", comment: "Alert user with unexpected status code from network request")
        case .noResponse:
            return NSLocalizedString("The server didn't give me a response.", comment: "Alert user with no response message from newtwork request")
        case .decode:
            return NSLocalizedString("I can't decode your request.", comment: "Alert user if we can't decode the newtwork request")
        }
    }
}

//
//  ApiErrorType.swift
//  Foodie
//
//  Created by Nurul Mustika on 26/11/24.
//

import Foundation

enum APIErrorType: Int, Error {
    /// Status code 400
    case badRequest = 400
    
    /// Status code 401
    case unauthorized = 401
    
    /// Status code 403
    case forbidden = 403
    
    /// Status code 404
    case notFound = 404
    
    /// Status code 406
    case notAcceptable = 406
    
    /// Status code 500
    case internalServerError = 500
    
    /// Status code 503
    case serviceUnavailable = 503
    
    /// Mapping error occured
    case mapping = 0
    
    /// Unknown error occured
    case unknown = -1
    
    /// Internet connection error occured
    case internetConnection = -2
    
    case invalidURL = -3
    
    case dataProcessing = -4
    
    static let allValues = [badRequest, unauthorized, forbidden, notFound, notAcceptable, internalServerError, serviceUnavailable, mapping, unknown, internetConnection, invalidURL, .dataProcessing]
}

final class APIError: Error {
    let type: APIErrorType
    let message: String
    
    init(with type: APIErrorType, message: String) {
        self.type = type
        self.message = message
    }
}

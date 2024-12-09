//
//  SearchGroceryProductsResponse.swift
//  Foodie
//
//  Created by Nurul Mustika on 09/12/24.
//

import Foundation

struct SearchGroceryProductsResponse: Codable {
    let type: String?
    let products: [Product]?
    let offset, number, totalProducts, processingTimeMS: Int?
    
    enum CodingKeys: String, CodingKey {
        case type, products, offset, number, totalProducts
        case processingTimeMS = "processingTimeMs"
    }
}

// MARK: - Product
struct Product: Codable {
    let id: Int?
    let title: String?
    let image: String?
    let imageType: String?
}

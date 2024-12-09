//
//  SearchMenuItemsResponse.swift
//  Foodie
//
//  Created by Nurul Mustika on 09/12/24.
//

import Foundation

struct SearchMenuItemsResponse: Codable {
    let type: String?
    let menuItems: [MenuItem]?
    let offset, number, totalMenuItems, processingTimeMS: Int?

    enum CodingKeys: String, CodingKey {
        case type, menuItems, offset, number, totalMenuItems
        case processingTimeMS = "processingTimeMs"
    }
}

// MARK: - MenuItem
struct MenuItem: Codable {
    let id: Int?
    let title: String?
    let image: String?
    let imageType: String?
    let restaurantChain: String?
    let servings: ServingsMenuItem?
}

// MARK: - Servings
struct ServingsMenuItem: Codable {
    let number: Int?
    let size: Double?
    let unit: String?
}

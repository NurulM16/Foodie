//
//  SearchAllFoodResponse.swift
//  Foodie
//
//  Created by Nurul Mustika on 26/11/24.
//

import Foundation

struct SearchAllFoodResponse: Codable {
    let sorting: String?
    let filterMapping: FilterMapping?
    let filterOptions, activeFilterOptions: [FilterOption]?
    let query: String?
    let totalResults, limit, offset: Int?
    let searchResults: [SearchAllFoodModel]?
    let expires: Int?
    let isStale: Bool?
}

// MARK: - FilterMapping
struct FilterMapping: Codable {
}

struct FilterOption: Codable {
    
}

// MARK: - SearchResult
struct SearchAllFoodModel: Codable {
    let name, type: String?
    let totalResults: Int?
    let totalResultsVariants: Int?
    let results: [AllFoodModel]?
}

// MARK: - Result
struct AllFoodModel: Codable {
    let id: Int?
    let name: String?
    let image: String?
    let link: String?
    let type: String?
    let relevance: Int?
    let content: String?
    let dataPoints: [DataPoint]?
}

struct DataPoint: Codable {
    
}

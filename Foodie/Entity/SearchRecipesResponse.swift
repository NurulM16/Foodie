//
//  SearchRecipesResponse.swift
//  Foodie
//
//  Created by Nurul Mustika on 29/11/24.
//

import Foundation

struct SearchRecipesResponse: Codable {
    let results: [SearchRecipesModel]?
    let offset, number, totalResults: Int?
}

struct SearchRecipesModel: Codable {
    let id: Int?
    let title: String?
    let image: String?
    let imageType: String?
}

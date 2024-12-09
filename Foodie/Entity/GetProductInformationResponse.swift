//
//  GetProductInformation.swift
//  Foodie
//
//  Created by Nurul Mustika on 09/12/24.
//

import Foundation

struct GetProductInformationResponse: Codable {
    let breadcrumbs: [String]?
    let category: String?
    let usdaCode: String?
    let id: Int?
    let title: String?
    let price, likes: Int?
    let badges, importantBadges: [String]?
    let nutrition: Nutrition?
    let servings: Servings?
    let spoonacularScore: Int?
    let aisle: String?
    let description: String?
    let image: String?
    let imageType: String?
    let images: [String]?
    let generatedText, upc, brand: String?
    let ingredients: [Ingredient]?
    let ingredientCount: Int?
    let ingredientList: String?
    let credits: Credits?
}

// MARK: - Credits
struct Credits: Codable {
    let text: String?
    let link: String?
    let image: String?
    let imageLink: String?
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let name: String?
    let safetyLevel: String?
    let description: String?

    enum CodingKeys: String, CodingKey {
        case name
        case safetyLevel = "safety_level"
        case description
    }
}

// MARK: - Nutrition
struct Nutrition: Codable {
    let nutrients: [Nutrient]?
    let caloricBreakdown: CaloricBreakdown?
    let calories: Int?
    let fat, protein, carbs: String?
}

// MARK: - CaloricBreakdown
struct CaloricBreakdown: Codable {
    let percentProtein, percentFat, percentCarbs: Double?
}

// MARK: - Nutrient
struct Nutrient: Codable {
    let name: String?
    let amount: Double?
    let unit: String?
    let percentOfDailyNeeds: Double?
}

// MARK: - Servings
struct Servings: Codable {
    let number, size: Int?
    let unit, raw: String?
}

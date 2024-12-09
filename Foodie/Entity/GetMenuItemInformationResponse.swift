//
//  GetMenuItemInformation.swift
//  Foodie
//
//  Created by Nurul Mustika on 09/12/24.
//

import Foundation

struct GetMenuItemInformationResponse: Codable {
    let id: Int?
    let title: String?
    let price: Double?
    let likes: Int?
    let badges: [Badges]?
    let nutrition: NutritionMenuItem?
    let images: [String]?
    let servings: ServingsMenuItemInfo?
    let spoonacularScore: Double?
    let breadcrumbs: [String]?
    let image: String?
    let imageType: String?
    let generatedText: String?
    let restaurantChain: String?
}

struct Badges: Codable {
    
}

// MARK: - Nutrition
struct NutritionMenuItem: Codable {
    let nutrients: [NutrientMenuItem]?
    let caloricBreakdown: CaloricBreakdownMenuItem?
    let calories: Int?
    let fat, protein, carbs: String?
}

// MARK: - CaloricBreakdown
struct CaloricBreakdownMenuItem: Codable {
    let percentProtein, percentFat, percentCarbs: Double?
}

// MARK: - Nutrient
struct NutrientMenuItem: Codable {
    let name: String?
    let amount: Int?
    let unit: String?
    let percentOfDailyNeeds: Double?
}

// MARK: - Servings
struct ServingsMenuItemInfo: Codable {
    let number, size: Int?
    let unit: String?
}

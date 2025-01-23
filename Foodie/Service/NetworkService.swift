//
//  NetworkService.swift
//  Foodie
//
//  Created by Nurul Mustika on 26/11/24.
//

import Moya

enum NetworkService {
    case searchAllFood
    case searchRecipes(query: String, number: Int)
    case getRecipeInformation(id: Int)
    case searchGroceryProducts(query: String, number: Int)
    case getProductInformation(id: Int)
    case searchMenuItems(query: String, number: Int)
    case getMenuItemInformation(id: Int)
    case getNutritionLabelImage(id: Int)
    case getAnalyzedRecipeInstructions(id: Int)
    case getIngredientImage(id: Int)
    
}

extension NetworkService: TargetType {
   var baseURL: URL {
        return URL(string: "https://api.spoonacular.com/")!
    }
    
    var path: String {
        switch self {
        case .searchAllFood:
            return "food/search"
        case .searchRecipes:
            return "recipes/complexSearch"
        case .getRecipeInformation(id: let id):
            return "recipes/\(id)/information"
        case .searchGroceryProducts:
            return "food/products/search"
        case .getProductInformation(id: let id):
            return "food/products/\(id)"
        case .searchMenuItems:
            return "food/menuItems/search"
        case .getMenuItemInformation(id: let id):
            return "food/menuItems/\(id)"
        case .getNutritionLabelImage(id: let id):
            return "recipes/\(id)/nutritionLabel.png"
        case .getAnalyzedRecipeInstructions(id: let id):
            return "recipes/\(id)/analyzedInstructions"
        case .getIngredientImage(id: let id):
            return "recipes/\(id)/ingredientWidget.png"
            
        }
    }
    
    var method: Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .searchRecipes(query: let query, number: let number), .searchGroceryProducts(query: let query, number: let number), .searchMenuItems(query: let query, number: let number):
            return .requestParameters(parameters: ["query": query, "number": number], encoding: URLEncoding.default)
        case .searchAllFood, .getRecipeInformation, .getProductInformation, .getMenuItemInformation, .getNutritionLabelImage, .getAnalyzedRecipeInstructions, .getIngredientImage:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .searchRecipes, .searchAllFood, .getRecipeInformation, .getProductInformation, .getMenuItemInformation, .getAnalyzedRecipeInstructions, .searchGroceryProducts, .searchMenuItems:
            return ["x-api-key": apiKey, "Content-Type": "application/json"]
        case .getNutritionLabelImage, .getIngredientImage:
            return ["x-api-key": apiKey, "Content-Type": "image/png"]
        }
        
    }
    
    
}

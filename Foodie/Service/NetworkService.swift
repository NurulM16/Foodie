//
//  NetworkService.swift
//  Foodie
//
//  Created by Nurul Mustika on 26/11/24.
//

import Moya

enum NetworkService {
    case searchAllFood
    case searchRecipes(query: String)
    case getRecipeInformation(id: Int)
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
        }
    }
    
    var method: Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .searchRecipes(query: let query):
            return .requestParameters(parameters: ["query": query], encoding: URLEncoding.default)
        case .searchAllFood, .getRecipeInformation:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        let parameters = ["x-api-key": "0340903970a24179bfe2833163521c80", "Content-Type": "application/json"]
        return parameters
    }
    
    
}

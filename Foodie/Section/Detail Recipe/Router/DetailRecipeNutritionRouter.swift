//
//  DetailRecipeNutritionRouter.swift
//  Foodie
//
//  Created by Nurul Mustika on 15/01/25.
//

import UIKit

protocol DetailRecipeNutritionRouterProtocol {
    static func createModule() -> NutritionViewController
}

class DetailRecipeNutritionRouter: DetailRecipeNutritionRouterProtocol {
    static func createModule() -> NutritionViewController {
        let view = NutritionViewController.instantiate(fromStoryboardName: "DetailRecipe")
        let presenter = DetailRecipeNutritionPresenter()
        let interactor = DetailRecipeNutritionInteractor()
        let router = DetailRecipeNutritionRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
}

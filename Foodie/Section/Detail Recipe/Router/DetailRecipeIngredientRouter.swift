//
//  DetailRecipeIngredientRouter.swift
//  Foodie
//
//  Created by Nurul Mustika on 06/01/25.
//

import Foundation

class DetailRecipeIngredientRouter: DetailRecipeIngredientPresenterToRouterProtocol {
    static func createModule() -> IngredientViewController {
        let view = IngredientViewController.instantiate(fromStoryboardName: "DetailRecipe")
        var presenter: DetailRecipeIngredientViewToPresenterProtocol & DetailRecipeIngredientInteractorToPresenterProtocol = DetailRecipeIngredientPresenter()
        var interactor: DetailRecipeIngredientPresenterToInteractorProtocol = DetailRecipeIngredientInteractor()
        let router: DetailRecipeIngredientPresenterToRouterProtocol = DetailRecipeIngredientRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        return view
    }
    
}

//
//  SearchRecipesRouter.swift
//  Foodie
//
//  Created by Nurul Mustika on 29/11/24.
//

import UIKit

class SearchRecipesRouter: SearchRecipesPresenterToRouterProtocol {
    
    static func createModule() -> SearchRecipesViewController {
        let view = SearchRecipesViewController.instantiate(fromStoryboardName: "Recipe")
        var presenter: SearchRecipesViewToPresenterProtocol & SearchRecipesInteractorToPresenterProtocol = SearchRecipesPresenter()
        var interactor: SearchRecipesPresenterToInteractorProtocol = SearchRecipesInteractor()
        let router: SearchRecipesPresenterToRouterProtocol = SearchRecipesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        return view
    }
    
    func navigateToDetailRecipe(navigatorController: UINavigationController, searchRecipe: SearchRecipesModel?) {
        let detailRecipeModule = DetailRecipeRouter.createModule()
        detailRecipeModule.searchRecipe = searchRecipe
        navigatorController.pushViewController(detailRecipeModule, animated: true)
    }
    
}

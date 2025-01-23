//
//  FavoriteRecipeRouter.swift
//  Foodie
//
//  Created by Nurul Mustika on 08/01/25.
//

import UIKit

protocol FavoriteRecipeRouterProtocol {
    static func createModule() -> UIViewController
    func navigateToDetailRecipe(with recipe: SearchRecipesModel)
}

class FavoriteRecipeRouter: FavoriteRecipeRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = FavoriteViewController.instantiate(fromStoryboardName: "Favorite")
        let presenter = FavoriteRecipePresenter()
        let interactor = FavoriteRecipeInteractor()
        let router = FavoriteRecipeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func navigateToDetailRecipe(with recipe: SearchRecipesModel) {
        let detailRecipeVC = DetailRecipeRouter.createModule()
        detailRecipeVC.searchRecipe = recipe
        viewController?.navigationController?.pushViewController(detailRecipeVC, animated: true)
    }
    
}

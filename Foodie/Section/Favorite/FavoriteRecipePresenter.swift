//
//  FavoriteRecipePresenter.swift
//  Foodie
//
//  Created by Nurul Mustika on 08/01/25.
//

import Foundation

protocol FavoriteRecipePresenterInput {
    var view: FavoriteRecipePresenterOutput? {get set}
    var interactor: FavoriteRecipeInteractorInput? {get set}
    var router: FavoriteRecipeRouterProtocol? {get set}
    func viewDidLoad()
    func didSelectRecipe(recipe: SearchRecipesModel)
    func didRemoveFavorite(recipe: SearchRecipesModel)
}

protocol FavoriteRecipePresenterOutput {
    func showFavoriteRecipes(recipes: [SearchRecipesModel])
    func showError(_ message: String)
    func refreshFavoriteRecipes()
}

class FavoriteRecipePresenter: FavoriteRecipePresenterInput {
    var router: FavoriteRecipeRouterProtocol?
    var view: FavoriteRecipePresenterOutput?
    var interactor: FavoriteRecipeInteractorInput?
    
    func viewDidLoad() {
        interactor?.fetchFavoriteRecipes()
    }
    
    func didSelectRecipe(recipe: SearchRecipesModel) {
        router?.navigateToDetailRecipe(with: recipe)
    }
    
    func didRemoveFavorite(recipe: SearchRecipesModel) {
        interactor?.removeFavoriteRecipe(recipe: recipe)
    }
    
}

extension FavoriteRecipePresenter: FavoriteRecipeInteractorOutput {
    func didFetchFavoriteRecipes(_ recipes: [SearchRecipesModel]) {
        view?.showFavoriteRecipes(recipes: recipes)
    }
    
    func didFailedToFetchFavoriteRecipes(with error: String) {
        view?.showError("Failed to fetch favorite recipes. Please try again!")
    }
    
    func didRemoveFavoriteRecipe() {
        interactor?.fetchFavoriteRecipes()
        view?.refreshFavoriteRecipes()
    }
    
}

//
//  FavoriteRecipeInteractor.swift
//  Foodie
//
//  Created by Nurul Mustika on 08/01/25.
//

import Foundation

protocol FavoriteRecipeInteractorInput {
    var presenter: FavoriteRecipeInteractorOutput? {get set}
    func fetchFavoriteRecipes()
    func removeFavoriteRecipe(recipe: SearchRecipesModel)
}

protocol FavoriteRecipeInteractorOutput {
    func didFetchFavoriteRecipes(_ recipes: [SearchRecipesModel])
    func didFailedToFetchFavoriteRecipes(with error: String)
    func didRemoveFavoriteRecipe()
}

class FavoriteRecipeInteractor: FavoriteRecipeInteractorInput {
    var presenter: FavoriteRecipeInteractorOutput?
    
    func fetchFavoriteRecipes() {
        let recipes = FavoritesDataManager.shared.fetchFavorites()
        presenter?.didFetchFavoriteRecipes(recipes)
    }
    
    func removeFavoriteRecipe(recipe: SearchRecipesModel) {
        FavoritesDataManager.shared.removeRecipe(recipe)
        presenter?.didRemoveFavoriteRecipe()
    }
    
}



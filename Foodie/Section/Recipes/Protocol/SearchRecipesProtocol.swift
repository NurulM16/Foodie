//
//  SearchRecipesProtocol.swift
//  Foodie
//
//  Created by Nurul Mustika on 29/11/24.
//

import UIKit

protocol SearchRecipesViewToPresenterProtocol {
    var view: SearchRecipesPresenterToViewProtocol? {get set}
    var interactor: SearchRecipesPresenterToInteractorProtocol? {get set}
    var router: SearchRecipesPresenterToRouterProtocol? {get set}
    func searchRecipes(query: String)
}

protocol SearchRecipesPresenterToViewProtocol {
    func onSuccess(data: SearchRecipesResponse?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}

protocol SearchRecipesPresenterToRouterProtocol {
    static func createModule() -> SearchRecipesViewController
    func navigateToDetailRecipe(navigatorController: UINavigationController, searchRecipe: SearchRecipesModel?)
}

protocol SearchRecipesPresenterToInteractorProtocol {
    var presenter: SearchRecipesInteractorToPresenterProtocol? {get set}
    func searchRecipes(query: String)
}

protocol SearchRecipesInteractorToPresenterProtocol {
    func onSuccess(data: SearchRecipesResponse?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}

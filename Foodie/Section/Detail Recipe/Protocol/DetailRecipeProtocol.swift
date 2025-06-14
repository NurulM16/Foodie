//
//  DetailRecipeProtocol.swift
//  Foodie
//
//  Created by Nurul Mustika on 03/12/24.
//

import UIKit

protocol DetailRecipeViewToPresenterProtocol {
    var view: DetailRecipePresenterToViewProtocol? {get set}
    var interactor: DetailRecipePresenterToInteractorProtocol? {get set}
    var router: DetailRecipePresenterToRouterProtocol? {get set}
    func getRecipeInformation(id: Int)
    func viewDidLoad(recipe: SearchRecipesModel?)
    func didTapFavoriteButton(recipe: SearchRecipesModel?)
    
    
}

protocol DetailRecipePresenterToViewProtocol {
    func onSuccess(data: GetRecipeInformationResponse?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
    func updateFavoriteIcon(isFavorite: Bool)
}

protocol DetailRecipePresenterToRouterProtocol {
    static func createModule() -> DetailRecipeViewController
}

protocol DetailRecipePresenterToInteractorProtocol {
    var presenter: DetailRecipeInteractorToPresenterProtocol? {get set}
    func getRecipeInformation(id: Int)
    func toggleFavoriteStatus(for recipe: SearchRecipesModel)
    func checkIfFavorite(_ recipe: SearchRecipesModel)
}

protocol DetailRecipeInteractorToPresenterProtocol {
    func onSuccess(data: GetRecipeInformationResponse?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
    func didUpdateFavoriteStatus(isFavorite: Bool)
}

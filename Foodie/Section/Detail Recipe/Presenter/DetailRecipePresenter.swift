//
//  DetailRecipePresenter.swift
//  Foodie
//
//  Created by Nurul Mustika on 03/12/24.
//

import UIKit

class DetailRecipePresenter: DetailRecipeViewToPresenterProtocol {
    
    var view: DetailRecipePresenterToViewProtocol?
    
    var interactor: DetailRecipePresenterToInteractorProtocol?
    
    var router: DetailRecipePresenterToRouterProtocol?
    
    func getRecipeInformation(id: Int) {
        interactor?.getRecipeInformation(id: id)
    }
    
    func viewDidLoad(recipe: SearchRecipesModel?) {
        guard let recipe = recipe else { return }
        interactor?.checkIfFavorite(recipe)
    }
    
    func didTapFavoriteButton(recipe: SearchRecipesModel?) {
        guard let recipe = recipe else { return }
        interactor?.toggleFavoriteStatus(for: recipe)
    }
    
}

extension DetailRecipePresenter: DetailRecipeInteractorToPresenterProtocol {
    func didUpdateFavoriteStatus(isFavorite: Bool) {
        view?.updateFavoriteIcon(isFavorite: isFavorite)
    }
    
    func onSuccess(data: GetRecipeInformationResponse?) {
        view?.onSuccess(data: data)
    }
    
    func fetchFailed(error: String) {
        view?.fetchFailed(error: error)
    }
    
    func isLoading(isLoading: Bool) {
        view?.isLoading(isLoading: isLoading)
    }
    
}

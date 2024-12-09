//
//  SearchRecipesPresenter.swift
//  Foodie
//
//  Created by Nurul Mustika on 29/11/24.
//

import Foundation

class SearchRecipesPresenter: SearchRecipesViewToPresenterProtocol {
    
    var view: SearchRecipesPresenterToViewProtocol?
    
    var interactor: SearchRecipesPresenterToInteractorProtocol?
    
    var router: SearchRecipesPresenterToRouterProtocol?
    
    func searchRecipes(query: String) {
        interactor?.searchRecipes(query: query)
    }
    
}

extension SearchRecipesPresenter: SearchRecipesInteractorToPresenterProtocol {
    func onSuccess(data: SearchRecipesResponse?) {
        view?.onSuccess(data: data)
    }
    
    func fetchFailed(error: String) {
        view?.fetchFailed(error: error)
    }
    
    func isLoading(isLoading: Bool) {
        view?.isLoading(isLoading: isLoading)
    }

    
}

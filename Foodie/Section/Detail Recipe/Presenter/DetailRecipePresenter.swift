//
//  DetailRecipePresenter.swift
//  Foodie
//
//  Created by Nurul Mustika on 03/12/24.
//

import Foundation

class DetailRecipePresenter: DetailRecipeViewToPresenterProtocol {
    var view: DetailRecipePresenterToViewProtocol?
    
    var interactor: DetailRecipePresenterToInteractorProtocol?
    
    var router: DetailRecipePresenterToRouterProtocol?
    
    func getRecipeInformation(id: Int) {
        interactor?.getRecipeInformation(id: id)
    }
    
}

extension DetailRecipePresenter: DetailRecipeInteractorToPresenterProtocol {
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
